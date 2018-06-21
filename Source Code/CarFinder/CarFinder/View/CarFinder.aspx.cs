using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Drawing;
using System.Text;
using System.Data;
using prototype.Model;

namespace prototype
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        private const string FILEPATH = "~/images/";
        private const string IgnoreImportance = "ignoreImportance";

        
        public void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["answers"] == null)
                    Session["answers"] = new Dictionary<int, Answer>();
                Session["answeredQuestion"] = false;
                Session["gaveImportanceFactor"] = false;
                Session["allMarkedButtons"] = new List<String>();
                Session["ActiveViewIndex"] = 0;
                Session["currentQuestionNumber"] = 1;
            }
            /*
            if (Session["ActiveViewIndex"] != null)
                MultiView1.ActiveViewIndex = (int)Session["ActiveViewIndex"];
            if (Session["Placeholder"] != null)
                PlaceHolder1.Controls.Add((PlaceHolder)Session["Placeholder"]);
*/

        }



        /// <summary>
        /// ButtonHandler for the Finish-Button:
        /// Finds the perfect car, shows car on the website
        /// and stores the searchquery
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>

        protected void GetData_Click(object sender, EventArgs e)
        {
            ResetAllButtons();
            List<Car> allCars = Repository.GetInstance().ReadAllCarsFromDB();
            List<Car> fittingCars = Repository.GetInstance().FindCar(allCars, (Dictionary<int, Answer>)Session["answers"]);
            Session["maxCarScore"] = Repository.GetInstance().MaximumScore((Dictionary<int, Answer>)Session["answers"]);
            //Session["fittingCar"] = fittingCar;
            foreach(Car c in fittingCars)
            {
                AddCarDisplayment(c);
            }
            MultiView1.ActiveViewIndex++;
            Session["ActiveViewIndex"] = MultiView1.ActiveViewIndex;
            Repository.GetInstance().StoreSearchQuery((Dictionary<int, Answer>)Session["answers"]);
        }




        /// <summary>
        /// AnswerButton Handler for every question which can be answered with exactly one answers
        /// </summary>
        /// <param name="sender">Button which got pressed</param>
        /// <param name="e"></param>
        protected void AnswerButtons_1_String(object sender, EventArgs e)
        {
            List<String> allMarkedButtons = (List<String>)Session["allMarkedButtons"];
            if (Session["_currentButton"] != null)
            {
                Button current = (Button)PlaceHolder1.FindControl(Session["_currentButton"].ToString());
                current.CssClass = "btn-Answer";
                allMarkedButtons.Remove(current.ID);
                Session["allMarkedButtons"] = allMarkedButtons;
            }
            Button btn = (Button)sender;
            Session["answeredQuestion"] = true;

            Session["tempAnswer"] = btn.Text;

            btn.CssClass = "btn-Answer-clicked";
            Session["_currentButton"] = btn.ID;
            allMarkedButtons.Add(btn.ID);
            Session["allMarkedButtons"] = allMarkedButtons;

        }

        /// <summary>
        /// AnswerButton Handler for every question which can be answered with more answers
        /// </summary>
        /// <param name="sender">Button which got pressed</param>
        /// <param name="e"></param>



        private void Page_Error(object sender, EventArgs e)
        {
            /*
            Exception exc = Server.GetLastError();


            Server.Transfer("~/ErrorPages/Oops.aspx");


            Server.ClearError();s*/
        }


        protected void AnswerButtons_List_String(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            List<string> currentList = (List<string>)Session["tempAnswer"];
            List<String> allMarkedButtons = (List<String>)Session["allMarkedButtons"];
            if (currentList == null || !currentList.Contains(btn.Text))
            {
                Session["answeredQuestion"] = true;
                if (currentList == null)
                    currentList = new List<string>();
                currentList.Add(btn.Text);
                Session["tempAnswer"] = currentList;
                btn.CssClass = "btn-Answer-clicked";
                allMarkedButtons.Add(btn.ID);
                Session["allMarkedButtons"] = allMarkedButtons;
            }
            else if (currentList.Contains(btn.Text))
            {
                currentList.Remove(btn.Text);
                if (currentList.Count == 0)
                {
                    currentList = null;
                    Session["answeredQuestion"] = false;
                }
                Session["tempAnswer"] = currentList;
                btn.CssClass = "btn-Answer";
                allMarkedButtons.Remove(btn.ID);
                Session["allMarkedButtons"] = allMarkedButtons;
            
            }
        }


        
            


        /// <summary>
        /// AnswerButton Handler for CylinderCount-Question
        /// </summary>
        /// <param name="sender">Button which got pressed</param>
        /// <param name="e"></param>
        protected void AnswerButtons_List_String_CC(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string arg = btn.CommandArgument;
            List<string> currentList = (List<string>)Session["tempAnswer"];
            List<string> allMarkedButtons = (List<string>)Session["allMarkedButtons"];
            if (currentList == null || !currentList.Contains(btn.Text))
            {
                Session["answeredQuestion"] = true;
                if (currentList == null || arg == btn.Text || currentList.Contains(arg))
                {
                    ReleaseAllAnswerButtons(allMarkedButtons);
                    allMarkedButtons = (List<string>)Session["allMarkedButtons"];
                    currentList = new List<string>();
                }
                currentList.Add(btn.Text);
                Session["tempAnswer"] = currentList;
                btn.CssClass = "btn-Answer-clicked";
                allMarkedButtons.Add(btn.ID);
                Session["allMarkedButtons"] = allMarkedButtons;
            }
            else if (currentList.Contains(btn.Text))
            {
                currentList.Remove(btn.Text);
                if (currentList.Count == 0)
                {
                    currentList = null;
                    Session["answeredQuestion"] = false;
                }
                Session["tempAnswer"] = currentList;
                btn.CssClass = "btn-Answer";
                allMarkedButtons.Remove(btn.ID);
                Session["allMarkedButtons"] = allMarkedButtons;
            }
        }

        /// <summary>
        /// AnswerButton Handler for PS-Question
        /// </summary>
        /// <param name="sender">Button which got pressed</param>
        /// <param name="e"></param>
        protected void AnswerButtons_List_String_PS(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            List<string> currentList = (List<string>)Session["tempAnswer"];
            List<String> allMarkedButtons = (List<String>)Session["allMarkedButtons"];
            if (currentList == null || !currentList.Contains(btn.Text))
            {
                Session["answeredQuestion"] = true;
                if (currentList == null)
                    currentList = new List<string>();
                int bntID = Int32.Parse(btn.ID.Split('_')[3]);
                if (allMarkedButtons != null && (allMarkedButtons.Contains("btn_ans_ps_" + (bntID + 1).ToString()) || allMarkedButtons.Contains("btn_ans_ps_" + (bntID - 1).ToString())))
                {
                    currentList.Add(btn.Text);
                    Session["tempAnswer"] = currentList;
                    btn.CssClass = "btn-Answer-clicked";
                    allMarkedButtons.Add(btn.ID);
                    Session["allMarkedButtons"] = allMarkedButtons;
                }
                else
                {
                    if (currentList.Count != 0)
                    {
                        ReleaseAllAnswerButtons(allMarkedButtons);
                        currentList = new List<string>();
                    }
                    currentList.Add(btn.Text);
                    Session["tempAnswer"] = currentList;
                    btn.CssClass = "btn-Answer-clicked";
                    allMarkedButtons = (List<String>)Session["allMarkedButtons"];
                    allMarkedButtons.Add(btn.ID);
                    Session["allMarkedButtons"] = allMarkedButtons;
                }

            }
            else if (currentList.Contains(btn.Text))
            {
                int bntID = Int32.Parse(btn.ID.Split('_')[3]);
                if (allMarkedButtons != null && allMarkedButtons.Contains("btn_ans_ps_" + (bntID + 1).ToString()) && allMarkedButtons.Contains("btn_ans_ps_" + (bntID - 1).ToString()))
                {
                    ReleaseAllAnswerButtons(allMarkedButtons);
                    allMarkedButtons = (List<String>)Session["allMarkedButtons"];
                    currentList = null;
                    Session["answeredQuestion"] = false;
                }
                else
                {
                    currentList.Remove(btn.Text);
                    if (currentList.Count == 0)
                    {
                        currentList = null;
                        Session["answeredQuestion"] = false;
                    }
                    allMarkedButtons.Remove(btn.ID);
                    Session["allMarkedButtons"] = allMarkedButtons;
                }
                Session["tempAnswer"] = currentList;
                btn.CssClass = "btn-Answer";

            }
        }

        /// <summary>
        /// Releases all answer Buttons
        /// </summary>
        /// <param name="allMarkedButtons"></param>
        private void ReleaseAllAnswerButtons(List<string> allMarkedButtons)
        {
            List<string> newList = new List<string>();
            foreach (string s in allMarkedButtons)
            {
                if (!s.Contains("imp"))
                {

                    Button temp = (Button)this.Master.FindControl("MainContent").FindControl(s);
                    temp.CssClass = "btn-Answer";
                }
                else
                {
                    newList.Add(s);
                }
            }
            Session["allMarkedButtons"] = newList;
        }



        /// <summary>
        /// Button Handler for all Importance Buttons
        /// </summary>
        /// <param name="sender">Button which got pressed</param>
        /// <param name="e"></param>
        protected void ImportanceClick(object sender, EventArgs e)
        {
            if (Session["_currentImportance"] != null)
            {
                Button current = (Button)PlaceHolder1.FindControl(Session["_currentImportance"].ToString());
                current.CssClass = "btn-Importance";
            }
            Button btn = (Button)sender;
            int curImportance = Int32.Parse(btn.Text);
            Session["gaveImportanceFactor"] = true;

            Session["tempImportancy"] = curImportance;

            btn.CssClass = "btn-Importance-clicked";
            Session["_currentImportance"] = btn.ID;
        }


        /// <summary>
        /// Button Handler for the Next-Button
        /// Checks if answers are already given, stores them and 
        /// redirects to the next question 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void next_Click(object sender, EventArgs e)
        {
            string arg = ((Button)sender).CommandArgument;

            if (arg != IgnoreImportance && (Session["answeredQuestion"] == null || Session["gaveImportanceFactor"] == null || !((bool)Session["answeredQuestion"]) || !((bool)Session["gaveImportanceFactor"])))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "myAlert", "myAlert();", true);
                return;
            }

            else if (Session["answeredQuestion"] == null || !((bool)Session["answeredQuestion"]))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "myAlert", "myAlert();", true);
                return;
            }
            else
            {
                Dictionary<int, Answer> answers = (Dictionary<int, Answer>)Session["answers"];

                if (answers.ContainsKey(MultiView1.ActiveViewIndex))
                {
                    answers.Remove(MultiView1.ActiveViewIndex);
                }
                int importance = 0;
                if (arg != IgnoreImportance)
                {
                    importance = (int)Session["tempImportancy"];
                }

                if (Session["tempAnswer"] is string)
                {
                    answers.Add(MultiView1.ActiveViewIndex, new Answer_1_String(Session["tempAnswer"].ToString(), importance));
                }
                else if (Session["tempAnswer"] is List<string>)
                {
                    answers.Add(MultiView1.ActiveViewIndex, new Answer_List_String((List<string>)Session["tempAnswer"], importance));
                }
                Session["answers"] = answers;
            }
            if (arg.StartsWith("Skip"))
            {
                string[] elements = arg.Split(';');
                if (Session["tempAnswer"] is string)
                {
                    if (elements[1] == Session["tempAnswer"].ToString())
                    {
                        MultiView1.ActiveViewIndex++;
                    }
                }
                else if (Session["tempAnswer"] is List<string>)
                {
                    List<string> temp = (List<string>)Session["tempAnswer"];
                    if (temp != null && temp.Count == 1 && temp.Contains(elements[1]))
                    {
                        if (arg.Contains("Skip2"))
                            MultiView1.ActiveViewIndex++;
                        MultiView1.ActiveViewIndex++;
                    }
                }
            }

            Session["tempAnswer"] = null;
            Session["tempImportancy"] = 0;

            Session["answeredQuestion"] = false;
            Session["gaveImportanceFactor"] = false;
            int curQuestionNumber = Int32.Parse(Session["currentQuestionNumber"].ToString());
            Session["currentQuestionNumber"] = curQuestionNumber + 1;

            MultiView1.ActiveViewIndex++;
            Session["ActiveViewIndex"] = MultiView1.ActiveViewIndex;
            Session["_currentButton"] = null;
            ResetAllButtons();
        }


        /// <summary>
        /// Help-function; Sets CssClass of all Buttons to the default class
        /// </summary>
        private void ResetAllButtons()
        {
            if (Session["_currentImportance"] != null)
            {
                Button current = (Button)PlaceHolder1.FindControl(Session["_currentImportance"].ToString());
                current.CssClass = "btn-Importance";
            }
            List<String> allMarkedButtons = (List<String>)Session["allMarkedButtons"];
            foreach (string s in allMarkedButtons)
            {
                Button temp = (Button)PlaceHolder1.FindControl(s);
                temp.CssClass = "btn-Answer";
            }
            Session["allMarkedButtons"] = new List<String>();
        }

        /// <summary>
        /// Redirects user to the first question
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Start_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex++;
            Session["ActiveViewIndex"] = MultiView1.ActiveViewIndex;
        }

        /// <summary>
        /// Clears the Session and redirects to the start if the user wants to start again
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Home_Click(object sender, EventArgs e)
        {
            Session.Contents.RemoveAll();
            ResetSession();
        }

        /// <summary>
        /// Resets all Session-Variables to the default value
        /// </summary>
        private void ResetSession()
        {
            Session["answers"] = new Dictionary<int, Answer>();
            Session["answeredQuestion"] = false;
            Session["gaveImportanceFactor"] = false;
            MultiView1.ActiveViewIndex = 0;
            Session["ActiveViewIndex"] = MultiView1.ActiveViewIndex;
            Session["allMarkedButtons"] = new List<String>();
        }


        /// <summary>
        /// Prepares car-displayment for the page and adds it to the placeholder
        /// </summary>
        /// <param name="sessionID"></param>
        protected void AddCarDisplayment(Car car)
        {
            System.Web.UI.WebControls.Image carImage = new System.Web.UI.WebControls.Image();
            carImage.ImageUrl = FILEPATH + car.ImagePath;
            carImage.CssClass = "cover";

            //car data
            System.Web.UI.HtmlControls.HtmlGenericControl div1 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            div1.Attributes.Add("class", "columns");
            div1.Style.Add(HtmlTextWriterStyle.MarginTop, "100px");

            System.Web.UI.HtmlControls.HtmlGenericControl div2 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            div2.Attributes.Add("class", "column is-1-desktop");

            System.Web.UI.HtmlControls.HtmlGenericControl div3 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            div3.Attributes.Add("class", "column is-9-desktop");

            System.Web.UI.HtmlControls.HtmlGenericControl div4 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            div4.Attributes.Add("class", "columns");

            //image
            System.Web.UI.HtmlControls.HtmlGenericControl div5 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            div5.Attributes.Add("class", "column is-3-desktop");

            System.Web.UI.HtmlControls.HtmlGenericControl div6 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            div6.Attributes.Add("class", "img-container grow");
            System.Web.UI.HtmlControls.HtmlImage img = new System.Web.UI.HtmlControls.HtmlImage();
            img.Attributes.Add("src", "images/" + car.ImagePath);
            div6.Controls.Add(img);

            //content
            System.Web.UI.HtmlControls.HtmlGenericControl div7 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            div7.Attributes.Add("class", "column is-6-desktop main");
            div7.Style.Add(HtmlTextWriterStyle.BackgroundColor, "#EB2121");
            div7.Style.Add(HtmlTextWriterStyle.FontSize, "1.5em");
            div7.Style.Add(HtmlTextWriterStyle.Color, "white");
            div7.Style.Add(HtmlTextWriterStyle.PaddingLeft, "20px");
            div7.Style.Add("line-height", "30px");
            double temp = Math.Round((car.Score / Double.Parse(Session["maxCarScore"].ToString()) * 100));
            div7.InnerHtml = "Marke & Modell: " + car.Make.ToString() + " " + car.Model.ToString() + "<br>" + "Motorleistung: " + car.Horsepower.ToString() + "PS" + "<br>" + "Basispreis : " + car.Baseprice.ToString() + "€" + "<br>" + "Übereinstimmung zu " + temp.ToString() + "%";
            //collapse
            System.Web.UI.HtmlControls.HtmlGenericControl collisionDiv1 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            collisionDiv1.Attributes.Add("class", "panel-group");
            collisionDiv1.Attributes.Add("id", "accordion" + car.Id);
            System.Web.UI.HtmlControls.HtmlGenericControl collisionDiv2 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            collisionDiv2.Attributes.Add("class", "panel panel-default");
            collisionDiv2.Style.Add(HtmlTextWriterStyle.Color, "#EB2121");
            collisionDiv2.Style.Add(HtmlTextWriterStyle.MarginLeft, "13px");
            collisionDiv2.Style.Add(HtmlTextWriterStyle.MarginRight, "13px");
            System.Web.UI.HtmlControls.HtmlGenericControl collisionDiv3 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            collisionDiv3.Attributes.Add("class", "panel-heading");
            System.Web.UI.HtmlControls.HtmlGenericControl h4 = new System.Web.UI.HtmlControls.HtmlGenericControl("H4");
            h4.Attributes.Add("class", "panel-title");
            System.Web.UI.HtmlControls.HtmlGenericControl a = new System.Web.UI.HtmlControls.HtmlGenericControl("A");
            a.Attributes.Add("class", "accordion-toggle");
            a.Attributes.Add("data-toggle", "collapse");
            a.Attributes.Add("data-parent", "#accordion");
            a.Attributes.Add("href", "#collapseOne" + car.Id);
            a.InnerHtml = "Mehr Info";
            System.Web.UI.HtmlControls.HtmlGenericControl collisionDiv4 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            collisionDiv4.Attributes.Add("class", "panel-collapse collapse");
            collisionDiv4.Attributes.Add("id", "collapseOne"+car.Id);
            collisionDiv4.Style.Add(HtmlTextWriterStyle.BackgroundColor, "#EB2121");
            collisionDiv4.Style.Add(HtmlTextWriterStyle.Color, "white");
            collisionDiv4.Style.Add(HtmlTextWriterStyle.FontSize, "1.5em");
            collisionDiv4.Style.Add("line-height", "25px");
            System.Web.UI.HtmlControls.HtmlGenericControl collisionDiv5 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            collisionDiv5.Attributes.Add("class", "panel-body");
            collisionDiv5.Style.Add(HtmlTextWriterStyle.FontSize, "1.5em");
            collisionDiv5.InnerHtml = "Beschleunigung 0 - 100 km/h: " + car.Acceleration.ToString() + " Sekunden" + "<br>" + "Sitze: " + car.Seats + "<br>" + "Durchschnittlicher Ausstattungspreis: " + car.AvgSpecPrice + "€" + "<br>" + "Antriebsart: " + car.DriveTrain + "<br>" + "Motorbauart: " + car.EngineConstruction + "<br>" + "Treibstoff: " + car.EngineType + "<br>" + "Verbrauch: " + car.FuelEconomy + "L/100km" + "<br>" + "Autotyp: " + car.CarType + "<br>" + "Getriebe: " + car.Transmission + "<br>" + "Kofferraumgröße: " + car.Trunksize + " Liter";

            h4.Controls.Add(a);
            collisionDiv3.Controls.Add(h4);
            collisionDiv2.Controls.Add(collisionDiv3);
            collisionDiv1.Controls.Add(collisionDiv2);
            collisionDiv4.Controls.Add(collisionDiv5);
            collisionDiv2.Controls.Add(collisionDiv4);

            div7.Controls.Add(collisionDiv1);

            //werbung
            System.Web.UI.HtmlControls.HtmlGenericControl div8 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            div8.Attributes.Add("class", "column is-3-desktop");
            div8.Attributes.Add("class", "column is-3-desktop");

            System.Web.UI.HtmlControls.HtmlGenericControl div9 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            div9.Attributes.Add("class", "column is-1-desktop");

            div5.Controls.Add(div6);

            div4.Controls.Add(div5);
            div4.Controls.Add(div7);
            div4.Controls.Add(div8);

            div3.Controls.Add(div4);

            div1.Controls.Add(div2);
            div1.Controls.Add(div3);
            div1.Controls.Add(div9);

            //row for collapse bug
            System.Web.UI.HtmlControls.HtmlGenericControl r2div1 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            r2div1.Attributes.Add("class", "columns");
            System.Web.UI.HtmlControls.HtmlGenericControl r2div2 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            r2div2.Attributes.Add("class", "column is-1-desktop");
            System.Web.UI.HtmlControls.HtmlGenericControl r2div3 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            r2div3.Attributes.Add("class", "column is-9-desktop");

            System.Web.UI.HtmlControls.HtmlGenericControl r2div4 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            r2div4.Attributes.Add("class", "columns");
            System.Web.UI.HtmlControls.HtmlGenericControl r2div5 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            r2div5.Attributes.Add("class", "column is-3-desktop");
            System.Web.UI.HtmlControls.HtmlGenericControl r2div6 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            r2div6.Attributes.Add("class", "column is-6-desktop main");
            r2div6.Style.Add(HtmlTextWriterStyle.BackgroundColor, "#EB2121");
            r2div6.Style.Add("line-height", "30px");
            r2div6.Controls.Add(collisionDiv1);
            System.Web.UI.HtmlControls.HtmlGenericControl r2div7 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            r2div7.Attributes.Add("class", "column is-3-desktop");

            System.Web.UI.HtmlControls.HtmlGenericControl r2div8 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            r2div8.Attributes.Add("class", "column is-1-desktop");

            r2div4.Controls.Add(r2div5);
            r2div4.Controls.Add(r2div6);
            r2div4.Controls.Add(r2div7);

            r2div3.Controls.Add(r2div4);

            r2div1.Controls.Add(r2div2);
            r2div1.Controls.Add(r2div3);
            r2div1.Controls.Add(r2div8);

            //Table & rows
            Table table = new Table();
            table.Style.Add(HtmlTextWriterStyle.Height, "0px");
            table.Style.Add(HtmlTextWriterStyle.Width, "100%");
            table.Style.Add(HtmlTextWriterStyle.Margin, "0px");
            table.Style.Add(HtmlTextWriterStyle.Padding, "0px");

            TableRow row = new TableRow();
            TableCell dataCell = new TableCell();
            dataCell.Controls.Add(div1);
            row.Controls.Add(dataCell);

            TableRow row2 = new TableRow();
            TableCell dataCell2 = new TableCell();
            dataCell2.Controls.Add(r2div1);
            row2.Controls.Add(dataCell2);

            


            table.Rows.AddAt(0, row);
            table.Rows.AddAt(1, row2);
            
            /*table.Controls.Add(row);
            table.Controls.Add(row2);*/

            PlaceHolder1.Controls.Add(table);
            Session["Placeholder"] = PlaceHolder1;

            /* AdCell */
            /*Advertisement randomAd = Repository.GetInstance().getRandomAdvertisement(car.Id);
            if (randomAd != null)
            {
                Label advertiserLabel = new Label();
                advertiserLabel.Text = randomAd.CarDealer;

                Label adPriceLabel = new Label();
                adPriceLabel.Text = randomAd.Price.ToString();

                string link = randomAd.Link;

                TableCell adCell = new TableCell();

                Table adTable = new Table();
                TableRow advertiserRow = new TableRow();
                TableCell advertiserCell = new TableCell();
                advertiserCell.Controls.Add(advertiserLabel);
                advertiserRow.Cells.Add(advertiserCell);
                adTable.Rows.Add(advertiserRow);


                TableRow adpriceRow = new TableRow();
                TableCell adpriceCell = new TableCell();
                adpriceCell.Controls.Add(adPriceLabel);
                adpriceRow.Cells.Add(adpriceCell);
                adTable.Rows.Add(adpriceRow);

                TableRow linkRow = new TableRow();
                TableCell linkCell = new TableCell();
                HyperLink linkControl = new HyperLink();
                linkControl.NavigateUrl = link;
                linkControl.Text = "Buy now!";
                linkControl.Target = "_blank";
                linkCell.Controls.Add(linkControl);
                linkRow.Cells.Add(linkCell);
                adTable.Rows.Add(linkRow);

                adCell.Controls.Add(adTable);

                row.Cells.Add(adCell);
                    }*/


            



            

;
        }


    }
}