﻿ <%@ Page Language="C#" Title="CarFinder" AutoEventWireup="true" MasterPageFile="Site.Master" CodeBehind="CarFinder.aspx.cs" Inherits="prototype.WebForm1" EnableViewState="true" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">  
        <asp:ScriptManager ID="ScriptManager3" runat="server"  ></asp:ScriptManager>    
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">      
                <ContentTemplate>                                      
                    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">

                        <asp:View ID="QuestionView_1" runat="server">
                            <div class="columns">
                                <div class=" column is-8-desktop is-offset-2-desktop">
                                    <div class="content" style="height: 50px;">
                                        <h1 class="column title has-text-centered is-8-desktop is-offset-2-desktop" style="color: white;"><%: Session["currentQuestionNumber"] %>. Frage</h1>
                                    </div>                            
                                </div> 
                            </div>
                            <div class="columns">
                                <div class=" column is-8-desktop is-offset-2-desktop">
                                    <div class="content" style="position: relative;background-color: #EB2121; height: 150px; border: 1px solid white;">
                                        <h1 class="title has-text-centered" style="color: white;">Wie alt bist du?</h1>
					
                                        <div class="tooltip"><i class="large material-icons">info_outline</i>
                                          <span class="tooltiptext">Bitte wähle eine der folgenden Antworten!</span>
                                        </div>
                                    </div>   

                         
                                </div>                       
                            </div>
                            <div class="columns">
                                <div class="column is-2-desktop is-offset-2-desktop">
                                    <asp:Button ID="AnswerButton1" runat="server" OnClick="AnswerButtons_1_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" data-wow-offset="50" data-wow-delay="0.3s" Text="17-21" />
                                </div>
                                <div class="column is-2-desktop">
                                    <asp:Button ID="AnswerButton2" runat="server" OnClick="AnswerButtons_1_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" data-wow-offset="50" data-wow-delay="0.3s" Text="22-30" />
                                </div>
                                <div class="column is-2-desktop">
                                    <asp:Button ID="Button204" runat="server" OnClick="AnswerButtons_1_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" data-wow-offset="50" data-wow-delay="0.3s" Text="31-45" />
                                </div>
                                <div class="column is-2-desktop">
                                    <asp:Button ID="Button205" runat="server" OnClick="AnswerButtons_1_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" data-wow-offset="50" data-wow-delay="0.3s" Text="46-60" />
                                </div>
                            </div>
                            <div class="columns">
                                <div class="column is-2-desktop is-offset-2-desktop">
                                    <asp:Button ID="AnswerButton3" runat="server" OnClick="AnswerButtons_1_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" data-wow-offset="50" data-wow-delay="0.3s" Text="61-70" />
                                </div>
                                <div class="column is-2-desktop">
                                    <asp:Button ID="AnswerButton4" runat="server" OnClick="AnswerButtons_1_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" data-wow-offset="50" data-wow-delay="0.3s" Text="70-85" />
                                </div>
                                <div class="column is-2-desktop">
                                    <asp:Button ID="Button206" runat="server" OnClick="AnswerButtons_1_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" data-wow-offset="50" data-wow-delay="0.3s" Text="85-100" />
                                </div>
                                <div class="column is-2-desktop">
                                    <asp:Button ID="Button207" runat="server" OnClick="AnswerButtons_1_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" data-wow-offset="50" data-wow-delay="0.3s" Text="100+" />
                                </div>
                            </div>   
                            <div class="columns">
                                <div class="column is-2-desktop is-offset-5-desktop">
                                    <asp:Button ID="ButtonNext1" runat="server" OnClick="next_Click" CommandArgument="ignoreImportance"  CssClass="btn-Next button wow fadeInUp is-fullwidth" data-wow-offset="50" data-wow-delay="0.3s" Text="Weiter" />
                                </div>
                            </div>
                            <div class="columns">
                                <div class="column is-6-desktop is-offset-3-desktop">
                                    <progress class="progress" value="17" max="289">5,8823529411764705882352941176471%</progress>
                                </div> 
                            </div>
                        </asp:View>

                        <asp:View ID="QuestionView_2" runat="server">
                            <div class="columns">
                                <div class=" column is-8-desktop is-offset-2-desktop">
                                    <div class="content" style="height: 50px;">
                                        <h1 class="column title has-text-centered is-8-desktop is-offset-2-desktop" style="color: white;"><%: Session["currentQuestionNumber"] %>. Frage</h1>
                                    </div>                            
                                </div>                             </div>
                            <div class="columns">
                                <div class=" column is-8-desktop is-offset-2-desktop">
                                    <div class="content" style="background-color: #EB2121; height: 150px;position: relative; border: 1px solid white;">
                                        <h1 class="title has-text-centered" style="color: white;">Welches Geschlecht hast du?</h1>
                                        <div class="tooltip"><i class="large material-icons">info_outline</i>
                                          <span class="tooltiptext">Bitte wähle eine der folgenden Antworten!</span>
                                        </div>
                                    </div>                            
                                </div>                       
                            </div>
                            <div class="columns">
                                <div class="column is-8-desktop is-offset-2-desktop">
                                    <div class="columns">
                                        <div class="column">
                                            <asp:Button ID="Button2" runat="server" OnClick="AnswerButtons_1_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Mann" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button3" runat="server" OnClick="AnswerButtons_1_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Frau" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button192" runat="server" OnClick="AnswerButtons_1_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Transgender" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="columns">
                                <div class="column is-2-desktop is-offset-5-desktop">
                                    <asp:Button ID="Button12" runat="server" CommandArgument="ignoreImportance" OnClick="next_Click" CssClass="btn-Next button wow fadeInUp is-fullwidth" Text="Weiter" />
                                </div>
                            </div>
                            <div class="columns">
                                <div class="column is-6-desktop is-offset-3-desktop">
                                    <progress class="progress" value="34" max="289">11,764705882352941176470588235294%</progress>
                                </div> 
                            </div>
                        </asp:View>

                        <asp:View ID="QuestionView_3" runat="server">
                            <div class="columns">
                                <div class=" column is-8-desktop is-offset-2-desktop">
                                    <div class="content" style="height: 50px;">
                                        <h1 class="column title has-text-centered is-8-desktop is-offset-2-desktop" style="color: white;"><%: Session["currentQuestionNumber"] %>. Frage</h1>
                                    </div>                            
                                </div>     

                            </div>
                            <div class="columns">
                                <div class=" column is-8-desktop is-offset-2-desktop">
                                    <div class="content" style="background-color: #EB2121;  height: 150px; border: 1px solid white; position:relative;">
                                        <h1 class="title has-text-centered" style="color: white;">Wie viel Geld möchtest du höchstens ausgeben?</h1>
                                        <div class="tooltip"><i class="large material-icons">info_outline</i>
                                          <span class="tooltiptext">Bitte wähle eine der folgenden Antworten!</span>
                                        </div>                                   
                                    </div>                            
                                </div>                       
                            </div>
                            <div class="columns">
                                <div class="column is-8-desktop is-offset-2-desktop">
                                    <div class="columns">
                                        <div class="column">
                                            <asp:Button ID="Button13" runat="server" OnClick="AnswerButtons_1_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="10 000" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button14" runat="server" OnClick="AnswerButtons_1_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="20 000" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button4" runat="server" OnClick="AnswerButtons_1_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="30 000" />
                                        </div>
                                    </div>
                                </div>                               
                            </div>
                            <div class="columns">
                                <div class="column is-8-desktop is-offset-2-desktop">
                                    <div class="columns">
                                        <div class="column">
                                            <asp:Button ID="Button5" runat="server" OnClick="AnswerButtons_1_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="50 000" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button6" runat="server" OnClick="AnswerButtons_1_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="75 000" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button193" runat="server" OnClick="AnswerButtons_1_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="100 000" />
                                        </div>
                                    </div>
                                </div>                               
                            </div>
                            <div class="columns">
                                <div class="column is-8-desktop is-offset-2-desktop">
                                    <div class="columns">
                                        <div class="column">
                                            <asp:Button ID="Button194" runat="server" OnClick="AnswerButtons_1_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="125 000" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button195" runat="server" OnClick="AnswerButtons_1_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="150 000" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button196" runat="server" OnClick="AnswerButtons_1_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Egal" />
                                        </div>
                                    </div>
                                </div>                               
                            </div>
                            <div class="columns">
                                <h1 class="column has-text-centered is-8-desktop is-offset-2-desktop" style="color: white; font-size: 23px">Wie viel Wert legst du auf den Preis?</h1>
                            </div>                         
                            <div class="columns">
                                <div class="column is-8-desktop is-offset-2-desktop">
                                    <div class="columns">
                                        <div class="column">
                                            <asp:Button ID="Button11" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="1" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button15" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="2" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button16" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="3" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button17" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="4" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button18" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="5" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="columns">
                                <div class="column is-2-desktop is-offset-5-desktop">
                                    <asp:Button ID="Button23" runat="server" OnClick="next_Click" CssClass="btn-Next button wow fadeInUp is-fullwidth" Text="Weiter" />
                                </div>
                            </div>
                            <div class="columns">
                                <div class="column is-6-desktop is-offset-3-desktop">
                                    <progress class="progress" value="51" max="289">17,647058823529411764705882352941%</progress>
                                </div> 
                            </div>
                        </asp:View>

                        <asp:View ID="QuestionView_4" runat="server">
                            <div class="columns">
                                <div class=" column is-8-desktop is-offset-2-desktop">
                                    <div class="content" style="height: 50px;">
                                        <h1 class="column title has-text-centered is-8-desktop is-offset-2-desktop" style="color: white;"><%: Session["currentQuestionNumber"] %>. Frage</h1>
                                    </div>                            
                                </div> 
                            </div>
                            <div class="columns">
                                <div class=" column is-8-desktop is-offset-2-desktop">
                                    <div class="content" style="background-color: #EB2121; height: 150px; border: 1px solid white;position:relative;">
                                        <h1 class="title has-text-centered" style="color: white;">Welche Automarken sind dir am liebsten?</h1>
                                        <div class="tooltip"><i class="large material-icons">info_outline</i>
                                          <span class="tooltiptext">Bitte wähle eine oder mehrere der folgenden Antworten!</span>
                                        </div>  
                                    </div>                            
                                </div>                       
                            </div>
                            <div class="columns">
                                <div class="column is-8-desktop is-offset-2-desktop">
                                    <div class="columns">
                                        <div class="column">
                                            <asp:Button ID="Button30" runat="server" OnClick="AnswerButtons_List_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Audi" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button31" runat="server" OnClick="AnswerButtons_List_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="BMW" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button32" runat="server" OnClick="AnswerButtons_List_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Mercedes" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button33" runat="server" OnClick="AnswerButtons_List_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Opel" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button34" runat="server" OnClick="AnswerButtons_List_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Fiat" />
                                        </div>
                                    </div>
                                </div>                               
                            </div>
                            <div class="columns">
                                <div class="column is-8-desktop is-offset-2-desktop">
                                    <div class="columns">
                                        <div class="column">
                                            <asp:Button ID="Button176" runat="server" OnClick="AnswerButtons_List_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="VW" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button177" runat="server" OnClick="AnswerButtons_List_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Skoda" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button178" runat="server" OnClick="AnswerButtons_List_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Seat" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button179" runat="server" OnClick="AnswerButtons_List_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Renault" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button180" runat="server" OnClick="AnswerButtons_List_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Ford" />
                                        </div>
                                    </div>
                                </div>                               
                            </div>
                            <div class="columns">
                                <div class="column is-8-desktop is-offset-2-desktop">
                                    <div class="columns">
                                        <div class="column">
                                            <asp:Button ID="Button189" runat="server" OnClick="AnswerButtons_List_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Hyundai" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button190" runat="server" OnClick="AnswerButtons_List_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Peugeot" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button191" runat="server" OnClick="AnswerButtons_List_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Mazda" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button198" runat="server" OnClick="AnswerButtons_List_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Citroen" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button199" runat="server" OnClick="AnswerButtons_List_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Volvo" />
                                        </div>
                                    </div>
                                </div>                               
                            </div>       
                            <div class="columns">
                                <h1 class="column has-text-centered is-8-desktop is-offset-2-desktop" style="color: white;font-size: 23px;">Wie sehr bevorzugst du deine Lieblingsmarken?</h1>
                            </div>                  
                            <div class="columns">
                                <div class="column is-8-desktop is-offset-2-desktop">
                                    <div class="columns">
                                        <div class="column">
                                            <asp:Button ID="Button200" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="1" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button201" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="2" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button202" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="3" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button203" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="4" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button208" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="5" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="columns">
                                <div class="column is-2-desktop is-offset-5-desktop">
                                    <asp:Button ID="Button197" runat="server" OnClick="next_Click" CssClass="btn-Next button wow fadeInUp is-fullwidth" Text="Weiter" />
                                </div>
                            </div>
                            <div class="columns">
                                <div class="column is-6-desktop is-offset-3-desktop">
                                    <progress class="progress" value="68" max="289">23,529411764705882352941176470588%</progress>
                                </div> 
                            </div
                        </asp:View>

                        <asp:View ID="QuestionView_5" runat="server">
                            <div class="columns">
                                <div class=" column is-8-desktop is-offset-2-desktop">
                                    <div class="content" style="height: 50px;">
                                        <h1 class="column title has-text-centered is-8-desktop is-offset-2-desktop" style="color: white;"><%: Session["currentQuestionNumber"] %>. Frage</h1>
                                    </div>                            
                                </div> 
                            </div>
                            <div class="columns">
                                <div class=" column is-8-desktop is-offset-2-desktop">
                                    <div class="content" style="background-color: #EB2121; height: 150px; border: 1px solid white;position:relative">
                                        <h1 class="title has-text-centered" style="color: white;">Wie soll das Auto gebaut sein?</h1>
                                        <div class="tooltip"><i class="large material-icons">info_outline</i>
                                          <span class="tooltiptext">Bitte wähle eine oder mehrere der folgenden Antworten!</span>
                                        </div>  
                                    </div>                            
                                </div>                       
                            </div>
                            <div class="columns">
                                <div class="column is-2-desktop is-offset-2-desktop">
                                    <asp:Button ID="Button46" runat="server" OnClick="AnswerButtons_List_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Kombi" />
                                </div>
                                <div class="column is-2-desktop">
                                    <asp:Button ID="Button47" runat="server" OnClick="AnswerButtons_List_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Minivan" />
                                </div>
                                <div class="column is-2-desktop">
                                    <asp:Button ID="Button48" runat="server" OnClick="AnswerButtons_List_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="SUV" />
                                </div>
                                <div class="column is-2-desktop">
                                    <asp:Button ID="Button49" runat="server" OnClick="AnswerButtons_List_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Coupe" />
                                </div>
                            </div>
                            <div class="columns">
                                <div class="column is-2-desktop is-offset-2-desktop">
                                    <asp:Button ID="Button50" runat="server" OnClick="AnswerButtons_List_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Kleinbus" />
                                </div>
                                <div class="column is-2-desktop">
                                    <asp:Button ID="Button51" runat="server" OnClick="AnswerButtons_List_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Kleinwagen" />
                                </div>
                                <div class="column is-2-desktop">
                                    <asp:Button ID="Button52" runat="server" OnClick="AnswerButtons_List_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Limousine" />
                                </div>
                                <div class="column is-2-desktop">
                                    <asp:Button ID="Button53" runat="server" OnClick="AnswerButtons_List_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Cabriolet" />
                                </div>
                            </div>                   
                            <div class="columns">
                                <h1 class="column has-text-centered is-8-desktop is-offset-2-desktop" style="color: white;font-size: 23px;">Wie wichtig ist dir die Aufbauart?</h1>
                            </div>
                            <div class="columns">
                                <div class="column is-8-desktop is-offset-2-desktop">
                                    <div class="columns">
                                        <div class="column">
                                            <asp:Button ID="Button19" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="1" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button20" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="2" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button21" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="3" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button22" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="4" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button24" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="5" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="columns">
                                <div class="column is-2-desktop is-offset-5-desktop">
                                    <asp:Button ID="Button59" runat="server" OnClick="next_Click" CssClass="btn-Next button wow fadeInUp is-fullwidth" Text="Weiter" />
                                </div>
                            </div>
                            <div class="columns">
                                <div class="column is-6-desktop is-offset-3-desktop">
                                    <progress class="progress" value="85" max="289">29,411764705882352941176470588235%</progress>
                                </div> 
                            </div
                        </asp:View>

                        <asp:View ID="QuestionView_6" runat="server">
                            <div class="columns">
                                <div class=" column is-8-desktop is-offset-2-desktop">
                                    <div class="content" style="height: 50px;">
                                        <h1 class="column title has-text-centered is-8-desktop is-offset-2-desktop" style="color: white;"><%: Session["currentQuestionNumber"] %>. Frage</h1>
                                    </div>                            
                                </div> 
                            </div>
                            <div class="columns">
                                <div class=" column is-8-desktop is-offset-2-desktop">
                                    <div class="content" style="background-color: #EB2121; height: 150px; border: 1px solid white; position:relative;">
                                        <h1 class="title has-text-centered" style="color: white;">Welche Automarken magst du überhaupt nicht?</h1>
                                        <div class="tooltip"><i class="large material-icons">info_outline</i>
                                          <span class="tooltiptext">Bitte wähle eine oder mehrere der folgenden Antworten!</span>
                                        </div>  
                                    </div>                            
                                </div>                       
                            </div>
                            <div class="columns">
                                <div class="column is-8-desktop is-offset-2-desktop">
                                    <div class="columns">
                                        <div class="column">
                                            <asp:Button ID="Button35" runat="server" OnClick="AnswerButtons_List_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Audi" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button36" runat="server" OnClick="AnswerButtons_List_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="BMW" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button37" runat="server" OnClick="AnswerButtons_List_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Mercedes" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button38" runat="server" OnClick="AnswerButtons_List_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Opel" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button39" runat="server" OnClick="AnswerButtons_List_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Fiat" />
                                        </div>
                                    </div>
                                </div>                               
                            </div>
                            <div class="columns">
                                <div class="column is-8-desktop is-offset-2-desktop">
                                    <div class="columns">
                                        <div class="column">
                                            <asp:Button ID="Button40" runat="server" OnClick="AnswerButtons_List_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="VW" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button41" runat="server" OnClick="AnswerButtons_List_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Skoda" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button42" runat="server" OnClick="AnswerButtons_List_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Seat" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button43" runat="server" OnClick="AnswerButtons_List_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Renault" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button44" runat="server" OnClick="AnswerButtons_List_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Ford" />
                                        </div>
                                    </div>
                                </div>                               
                            </div>
                            <div class="columns">
                                <div class="column is-8-desktop is-offset-2-desktop">
                                    <div class="columns">
                                        <div class="column">
                                            <asp:Button ID="Button45" runat="server" OnClick="AnswerButtons_List_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Hyundai" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button60" runat="server" OnClick="AnswerButtons_List_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Peugeot" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button61" runat="server" OnClick="AnswerButtons_List_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Mazda" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button62" runat="server" OnClick="AnswerButtons_List_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Citroen" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button63" runat="server" OnClick="AnswerButtons_List_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Volvo" />
                                        </div>
                                    </div>
                                </div>                               
                            </div>       
                            <div class="columns">
                                <h1 class="column has-text-centered is-8-desktop is-offset-2-desktop" style="color: white;font-size: 23px;">Wie wichtig ist dir, dass Autos von diesen Marken ausgeschlossen werden?</h1>
                            </div>                  
                            <div class="columns">
                                <div class="column is-8-desktop is-offset-2-desktop">
                                    <div class="columns">
                                        <div class="column">
                                            <asp:Button ID="Button25" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="1" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button26" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="2" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button27" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="3" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button28" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="4" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button29" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="5" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="columns">
                                <div class="column is-2-desktop is-offset-5-desktop">
                                    <asp:Button ID="Button69" runat="server" OnClick="next_Click" CssClass="btn-Next button wow fadeInUp is-fullwidth" Text="Weiter" />
                                </div>
                            </div>
                            <div class="columns">
                                <div class="column is-6-desktop is-offset-3-desktop">
                                    <progress class="progress" value="102" max="289">35,294117647058823529411764705882%</progress>
                                </div> 
                            </div
                        </asp:View>

                        <asp:View ID="QuestionView_7" runat="server">
                            <div class="columns">
                                <div class=" column is-8-desktop is-offset-2-desktop">
                                    <div class="content" style="height: 50px;">
                                        <h1 class="column title has-text-centered is-8-desktop is-offset-2-desktop" style="color: white;"><%: Session["currentQuestionNumber"] %>. Frage</h1>
                                    </div>                            
                                </div> 
                            </div>
                            <div class="columns">
                                <div class=" column is-8-desktop is-offset-2-desktop">
                                    <div class="content" style="background-color: #EB2121; height: 150px; border: 1px solid white; position:relative;">
                                        <h1 class="title has-text-centered" style="color: white;">Welchen Nutzen wird das Auto hauptsächlich haben?</h1>
                                        <div class="tooltip"><i class="large material-icons">info_outline</i>
                                          <span class="tooltiptext">Bitte wähle eine der folgenden Antworten!</span>
                                        </div>  
                                    </div>                            
                                </div>                       
                            </div>
                            <div class="columns">
                                <div class="column is-4-desktop is-offset-2-desktop">
                                    <asp:Button ID="Button70" runat="server" OnClick="AnswerButtons_1_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Alltagsauto" />
                                </div>
                                <div class="column is-4-desktop">
                                    <asp:Button ID="Button71" runat="server" OnClick="AnswerButtons_1_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Freizeitauto" />
                                </div>
                            </div>
                                
                            </div>
                            <div class="columns">
                                <h1 class="column has-text-centered is-8-desktop is-offset-2-desktop" style="color: white;font-size: 23px;">Wie wichtig ist dir das?</h1>
                            </div>
                            <div class="columns">
                                <div class="column is-8-desktop is-offset-2-desktop">
                                    <div class="columns">
                                        <div class="column">
                                            <asp:Button ID="ButtonI30" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="1" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="ButtonI31" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="2" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="ButtonI32" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="3" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="ButtonI33" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="4" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="ButtonI34" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="5" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="columns">
                                <div class="column is-2-desktop is-offset-5-desktop">
                                    <asp:Button ID="Button78" runat="server" OnClick="next_Click" CssClass="btn-Next button wow fadeInUp is-fullwidth" Text="Weiter" />
                                </div>
                            </div>
                            <div class="columns">
                                <div class="column is-6-desktop is-offset-3-desktop">
                                    <progress class="progress  " value="119" max="289">41,176470588235294117647058823529%</progress>
                                </div> 
                            </div
                        </asp:View>

                        <asp:View ID="QuestionView_8" runat="server">
                            <div class="columns">
                                <div class=" column is-8-desktop is-offset-2-desktop">
                                    <div class="content" style="height: 50px;">
                                        <h1 class="column title has-text-centered is-8-desktop is-offset-2-desktop" style="color: white;"><%: Session["currentQuestionNumber"] %>. Frage</h1>
                                    </div>                            
                                </div> 
                            </div>
                            <div class="columns">
                                <div class=" column is-8-desktop is-offset-2-desktop">
                                    <div class="content" style="background-color: #EB2121; height: 150px; border: 1px solid white; position:relative;">
                                        <h1 class="title has-text-centered" style="color: white;">Werden mit dem Auto regelmäßig andere Personen mitfahren (wenn ja, wie viele)?</h1>
                                        <div class="tooltip"><i class="large material-icons">info_outline</i>
                                          <span class="tooltiptext">Bitte wähle eine der folgenden Antworten!</span>
                                        </div>  
                                    </div>                            
                                </div>                       
                            </div>
                            <div class="columns">
                                <div class="column is-4-desktop is-offset-2-desktop">
                                    <asp:Button ID="Button72" runat="server" OnClick="AnswerButtons_1_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Nein" />
                                </div>
                                <div class="column is-4-desktop">
                                    <asp:Button ID="Button79" runat="server" OnClick="AnswerButtons_1_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="1" />
                                </div>
                            </div>
                            <div class="columns">
                                <div class="column is-4-desktop is-offset-2-desktop">
                                    <asp:Button ID="Button86" runat="server" OnClick="AnswerButtons_1_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="2" />
                                </div>
                                <div class="column is-4-desktop">
                                    <asp:Button ID="Button87" runat="server" OnClick="AnswerButtons_1_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="3" />
                                </div>
                            </div>
                            <div class="columns">
                                <div class="column is-4-desktop"></div>
                                <div class="column is-4-desktop">
                                    <asp:Button ID="Button88" runat="server" OnClick="AnswerButtons_1_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="3+" />
                                </div>
                                <div class="column is-4-desktop"></div>
                            </div>
                            <div class="columns">
                                <h1 class="column has-text-centered is-8-desktop is-offset-2-desktop" style="color: white;font-size: 23px;">Wie wichtig ist dir, dass das Auto genügend Platz für Mitfahrer hat?</h1>
                            </div>
                            <div class="columns">
                                <div class="column is-8-desktop is-offset-2-desktop">
                                    <div class="columns">
                                        <div class="column">
                                            <asp:Button ID="Button54" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="1" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button55" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="2" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button56" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="3" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button57" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="4" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button58" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="5" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="columns">
                                <div class="column is-2-desktop is-offset-5-desktop">
                                    <asp:Button ID="Button85" runat="server" OnClick="next_Click" CommandArgument="SkipIf;Nein" CssClass="btn-Next button wow fadeInUp is-fullwidth" Text="Weiter" />
                                </div>
                            </div>
                            <div class="columns">
                                <div class="column is-6-desktop is-offset-3-desktop">
                                    <progress class="progress  " value="136" max="289">47,058823529411764705882352941176%</progress>
                                </div> 
                            </div
                        </asp:View>

                        <asp:View ID="QuestionView_8_Optional" runat="server">
                           <div class="columns">
                                <div class=" column is-8-desktop is-offset-2-desktop">
                                    <div class="content" style="height: 50px;">
                                        <h1 class="column title has-text-centered is-8-desktop is-offset-2-desktop" style="color: white;"><%: Session["currentQuestionNumber"] %>. Frage</h1>
                                    </div>                            
                                </div> 
                            </div>
                            <div class="columns">
                                <div class=" column is-8-desktop is-offset-2-desktop">
                                    <div class="content" style="background-color: #EB2121; height: 150px; border: 1px solid white; position:relative;">
                                        <h1 class="title has-text-centered" style="color: white;">Wird ein Kindersitz verwendet?</h1>
                                        <div class="tooltip"><i class="large material-icons">info_outline</i>
                                          <span class="tooltiptext">Bitte wähle eine der folgenden Antworten!</span>
                                        </div>  
                                    </div>                            
                                </div>                       
                            </div>
                            <div class="columns">
                                <div class="column is-4-desktop is-offset-2-desktop">
                                    <asp:Button ID="Button212" runat="server" OnClick="AnswerButtons_1_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Ja" />
                                </div>
                                <div class="column is-4-desktop">
                                    <asp:Button ID="Button213" runat="server" OnClick="AnswerButtons_1_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Nein" />
                                </div>
                            </div>
                                
                            </div>
                            <div class="columns">
                                <h1 class="column has-text-centered is-8-desktop is-offset-2-desktop" style="color: white;font-size: 23px;">Wie wichtig ist dir, dass das Auto Kindersitztauglich ist?</h1>
                            </div>
                            <div class="columns">
                                <div class="column is-8-desktop is-offset-2-desktop">7
                                    <div class="columns">
                                        <div class="column">
                                            <asp:Button ID="Button64" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="1" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button65" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="2" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button66" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="3" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button67" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="4" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button68" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="5" />
                                        </div>
                                    </div>
                                </div>    
                            </div>
                            <div class="columns">
                                <div class="column is-2-desktop is-offset-5-desktop">
                                    <asp:Button ID="Button220" runat="server" OnClick="next_Click" CssClass="btn-Next button wow fadeInUp is-fullwidth" Text="Weiter" />
                                </div>
                            </div>
                            <div class="columns">
                                <div class="column is-6-desktop is-offset-3-desktop">
                                    <progress class="progress  " value="136" max="289">47,058823529411764705882352941176%</progress>
                                </div> 
                            </div
                        </asp:View>

                        <asp:View ID="QuestionView_9" runat="server">
                            <div class="columns">
                                <div class=" column is-8-desktop is-offset-2-desktop">
                                    <div class="content" style="height: 50px;">
                                        <h1 class="column title has-text-centered is-8-desktop is-offset-2-desktop" style="color: white;"><%: Session["currentQuestionNumber"] %>. Frage</h1>
                                    </div>                            
                                </div> 
                            </div>
                            <div class="columns">
                                <div class=" column is-8-desktop is-offset-2-desktop">
                                    <div class="content" style="background-color: #EB2121; height: 150px; border: 1px solid white; position:relative;">
                                        <h1 class="title has-text-centered" style="color: white;">Wie groß soll der Kofferraum sein?</h1>
                                        <div class="tooltip"><i class="large material-icons">info_outline</i>
                                          <span class="tooltiptext">Bitte wähle eine der folgenden Antworten!</span>
                                        </div>  
                                    </div>                            
                                </div>                       
                            </div>
                            <div class="columns">
                                <div class="column is-8-desktop is-offset-2-desktop">
                                    <div class="columns">
                                        <div class="column">
                                            <asp:Button ID="Button89" runat="server" OnClick="AnswerButtons_1_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Klein" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button90" runat="server" OnClick="AnswerButtons_1_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Mittel" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button91" runat="server" OnClick="AnswerButtons_1_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Groß" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                                
                            </div>
                            <div class="columns">
                                <h1 class="column has-text-centered is-8-desktop is-offset-2-desktop" style="color: white;font-size: 23px;">Wie viel Wert legst du auf die Größe des Kofferraums?</h1>
                            </div>
                            <div class="columns">
                                <div class="column is-8-desktop is-offset-2-desktop">
                                    <div class="columns">
                                        <div class="column">
                                            <asp:Button ID="Button73" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="1" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button74" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="2" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button75" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="3" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button76" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="4" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button77" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="5" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="columns">
                                <div class="column is-2-desktop is-offset-5-desktop">
                                    <asp:Button ID="Button97" runat="server" OnClick="next_Click" CssClass="btn-Next button wow fadeInUp is-fullwidth" Text="Weiter" />
                                </div>
                            </div>
                            <div class="columns">
                                <div class="column is-6-desktop is-offset-3-desktop">
                                    <progress class="progress  " value="153" max="289">52,941176470588235294117647058824%</progress>
                                </div> 
                            </div
                        </asp:View>
                            
                        <asp:View ID="QuestionView_10" runat="server">
                            <div class="columns">
                                <div class=" column is-8-desktop is-offset-2-desktop">
                                    <div class="content" style="height: 50px;">
                                        <h1 class="column title has-text-centered is-8-desktop is-offset-2-desktop" style="color: white;"><%: Session["currentQuestionNumber"] %>. Frage</h1>
                                    </div>                            
                                </div> 
                            </div>
                            <div class="columns">
                                <div class=" column is-8-desktop is-offset-2-desktop">
                                    <div class="content" style="background-color: #EB2121; height: 150px; border: 1px solid white; position:relative;">
                                        <h1 class="title has-text-centered" style="color: white;">Wofür wird das Auto hauptsächlich benutzt?</h1>
                                        <div class="tooltip"><i class="large material-icons">info_outline</i>
                                          <span class="tooltiptext">Bitte wähle eine der folgenden Antworten!</span>
                                        </div>  
                                    </div>                            
                                </div>                       
                            </div>
                            <div class="columns">
                                <div class="column is-4-desktop is-offset-2-desktop">
                                    <asp:Button ID="Button98" runat="server" OnClick="AnswerButtons_1_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Kurzstrecken / Stadtverkehr" />
                                </div>
                                <div class="column is-4-desktop">
                                    <asp:Button ID="Button99" runat="server" OnClick="AnswerButtons_1_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Langstrecken" />
                                </div>
                            </div>
                                
                            </div>
                            <div class="columns">
                                <h1 class="column has-text-centered is-8-desktop is-offset-2-desktop" style="color: white;font-size: 23px;">Wie wichtig ist dir, dass das Auto diesem Anspruch gerecht ist?</h1>
                            </div>
                            <div class="columns">
                                <div class="column is-8-desktop is-offset-2-desktop">
                                    <div class="columns">
                                        <div class="column">
                                            <asp:Button ID="Button80" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="1" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button81" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="2" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button82" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="3" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button83" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="4" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button84" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="5" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="columns">
                                <div class="column is-2-desktop is-offset-5-desktop">
                                    <asp:Button ID="Button105" runat="server" OnClick="next_Click" CssClass="btn-Next button wow fadeInUp is-fullwidth" Text="Weiter" />
                                </div>
                            </div>
                            <div class="columns">
                                <div class="column is-6-desktop is-offset-3-desktop">
                                    <progress class="progress  " value="170" max="289">58,823529411764705882352941176471%</progress>
                                </div> 
                            </div
                        </asp:View>

                        <asp:View ID="QuestionView_11" runat="server">
                            <div class="columns">
                                <div class=" column is-8-desktop is-offset-2-desktop">
                                    <div class="content" style="height: 50px;">
                                        <h1 class="column title has-text-centered is-8-desktop is-offset-2-desktop" style="color: white;"><%: Session["currentQuestionNumber"] %>. Frage</h1>
                                    </div>                            
                                </div> 
                            </div>
                            <div class="columns">
                                <div class=" column is-8-desktop is-offset-2-desktop">
                                    <div class="content" style="background-color: #EB2121; height: 150px; border: 1px solid white; position:relative;">
                                        <h1 class="title has-text-centered" style="color: white;">Welche Motorisierung wird bevorzugt?</h1>
                                        <div class="tooltip"><i class="large material-icons">info_outline</i>
                                          <span class="tooltiptext">Bitte wähle eine oder mehrere der folgenden Antworten!</span>
                                        </div>  
                                    </div>                            
                                </div>                       
                            </div>
                            <div class="columns">
                                <div class="column is-4-desktop is-offset-2-desktop">
                                    <asp:Button ID="Button106" runat="server" OnClick="AnswerButtons_List_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Hybrid" />
                                </div>
                                <div class="column is-4-desktop">
                                    <asp:Button ID="Button107" runat="server" OnClick="AnswerButtons_List_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Benzin" />
                                </div>
                            </div>
                            <div class="columns">
                                <div class="column is-4-desktop is-offset-2-desktop">
                                    <asp:Button ID="Button114" runat="server" OnClick="AnswerButtons_List_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Diesel" />
                                </div>
                                <div class="column is-4-desktop">
                                    <asp:Button ID="Button115" runat="server" OnClick="AnswerButtons_List_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Elektro" />
                                </div>
                            </div>
                            </div>
                            <div class="columns">
                                <h1 class="column has-text-centered is-8-desktop is-offset-2-desktop" style="color: white;font-size: 23px;">Wie viel Wert legst du auf die Motorisierung?</h1>
                            </div>
                            <div class="columns">
                                <div class="column is-8-desktop is-offset-2-desktop">
                                    <div class="columns">
                                        <div class="column">
                                            <asp:Button ID="Button92" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="1" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button93" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="2" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button94" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="3" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button95" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="4" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button96" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="5" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="columns">
                                <div class="column is-2-desktop is-offset-5-desktop">
                                    <asp:Button ID="Button113" runat="server" OnClick="next_Click" CssClass="btn-Next button wow fadeInUp is-fullwidth" CommandArgument="Skip2If;Elektro" Text="Weiter" />
                                </div>
                            </div>
                            <div class="columns">
                                <div class="column is-6-desktop is-offset-3-desktop">
                                    <progress class="progress  " value="187" max="289">64,705882352941176470588235294118%</progress>
                                </div> 
                            </div
                        </asp:View>

                        <asp:View ID="QuestionView_11_Optional" runat="server">
                           <div class="columns">
                                <div class=" column is-8-desktop is-offset-2-desktop">
                                    <div class="content" style="height: 50px;">
                                        <h1 class="column title has-text-centered is-8-desktop is-offset-2-desktop" style="color: white;"><%: Session["currentQuestionNumber"] %>. Frage</h1>
                                    </div>                            
                                </div> 
                            </div>
                            <div class="columns">
                                <div class=" column is-8-desktop is-offset-2-desktop">
                                    <div class="content" style="background-color: #EB2121; height: 150px; border: 1px solid white; position:relative;">
                                        <h1 class="title has-text-centered" style="color: white;">Gibt es eine Motorbauart die dir besonders gefällt?</h1>
                                        <div class="tooltip"><i class="large material-icons">info_outline</i>
                                          <span class="tooltiptext">Bitte wähle eine oder mehrere der folgenden Antworten!</span>
                                        </div>  
                                    </div>                            
                                </div>                       
                            </div>
                            <div class="columns">
                                <div class="column is-2-desktop is-offset-2-desktop">
                                    <asp:Button ID="Button116" runat="server" OnClick="AnswerButtons_List_String_CC" CssClass="btn-Answer button wow fadeInUp is-fullwidth" CommandArgument="Nein" Text="4-Zylinder" />
                                </div>
                                <div class="column is-2-desktop">
                                    <asp:Button ID="Button117" runat="server" OnClick="AnswerButtons_List_String_CC" CssClass="btn-Answer button wow fadeInUp is-fullwidth" CommandArgument="Nein" Text="5-Zylinder" />
                                </div>
                                <div class="column is-2-desktop">
                                    <asp:Button ID="Button118" runat="server" OnClick="AnswerButtons_List_String_CC" CssClass="btn-Answer button wow fadeInUp is-fullwidth" CommandArgument="Nein" Text="Reihen-6-Zylinder" />
                                </div>
                                <div class="column is-2-desktop">
                                    <asp:Button ID="Button119" runat="server" OnClick="AnswerButtons_List_String_CC" CssClass="btn-Answer button wow fadeInUp is-fullwidth" CommandArgument="Nein" Text="V6" />
                                </div>
                            </div>
                            <div class="columns">
                                <div class="column is-2-desktop is-offset-2-desktop">
                                    <asp:Button ID="Button120" runat="server" OnClick="AnswerButtons_List_String_CC" CssClass="btn-Answer button wow fadeInUp is-fullwidth" CommandArgument="Nein" Text="V8" />
                                </div>
                                <div class="column is-2-desktop">
                                    <asp:Button ID="Button121" runat="server" OnClick="AnswerButtons_List_String_CC" CssClass="btn-Answer button wow fadeInUp is-fullwidth" CommandArgument="Nein" Text="V10" />
                                </div>
                                <div class="column is-2-desktop">
                                    <asp:Button ID="Button122" runat="server" OnClick="AnswerButtons_List_String_CC" CssClass="btn-Answer button wow fadeInUp is-fullwidth" CommandArgument="Nein" Text="V12" />
                                </div>
                                <div class="column is-2-desktop">
                                    <asp:Button ID="Button123" runat="server" OnClick="AnswerButtons_List_String_CC" CssClass="btn-Answer button wow fadeInUp is-fullwidth" CommandArgument="Nein" Text="Nein" />
                                </div>
                            </div>                   
                            <div class="columns">
                                <h1 class="column has-text-centered is-8-desktop is-offset-2-desktop" style="color: white;font-size: 23px;">Wie wichtig ist dir die Motorbauart?</h1>
                            </div>
                            <div class="columns">
                                <div class="column is-8-desktop is-offset-2-desktop">
                                    <div class="columns">
                                        <div class="column">
                                            <asp:Button ID="Button100" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="1" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button101" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="2" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button102" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="3" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button103" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="4" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button104" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="5" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="columns">
                                <div class="column is-2-desktop is-offset-5-desktop">
                                    <asp:Button ID="Button129" runat="server" OnClick="next_Click" CssClass="btn-Next button wow fadeInUp is-fullwidth" Text="Weiter" />
                                </div>
                            </div>
                            <div class="columns">
                                <div class="column is-6-desktop is-offset-3-desktop">
                                    <progress class="progress  " value="187" max="289">64,705882352941176470588235294118%</progress>
                                </div> 
                            </div
                        </asp:View>

                        <asp:View ID="QuestionView_12" runat="server">
                            <div class="columns">
                                <div class=" column is-8-desktop is-offset-2-desktop">
                                    <div class="content" style="height: 50px;">
                                        <h1 class="column has-text-centered is-8-desktop is-offset-2-desktop" style="color: white;font-size: 23px;"><%: Session["currentQuestionNumber"] %>. Frage</h1>
                                    </div>                            
                                </div> 
                            </div>
                            <div class="columns">
                                <div class=" column is-8-desktop is-offset-2-desktop">
                                    <div class="content" style="background-color: #EB2121; height: 150px; border: 1px solid white; position:relative;">
                                        <h1 class="title has-text-centered" style="color: white;">Wie viel soll das Auto durchschnittlich höchstens verbrauchen?</h1>
                                        <div class="tooltip"><i class="large material-icons">info_outline</i>
                                          <span class="tooltiptext">Bitte wähle eine der folgenden Antworten!</span>
                                        </div>  
                                    </div>                            
                                </div>                       
                            </div>
                            <div class="columns">
                                <div class="column is-4-desktop is-offset-2-desktop">
                                    <asp:Button ID="Button130" runat="server" OnClick="AnswerButtons_1_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="0-4,5" />
                                </div>
                                <div class="column is-4-desktop">
                                    <asp:Button ID="Button131" runat="server" OnClick="AnswerButtons_1_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="4,5-6" />
                                </div>
                            </div>
                            <div class="columns">
                                <div class="column is-4-desktop is-offset-2-desktop">
                                    <asp:Button ID="Button134" runat="server" OnClick="AnswerButtons_1_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="6-8" />
                                </div>
                                <div class="column is-4-desktop">
                                    <asp:Button ID="Button135" runat="server" OnClick="AnswerButtons_1_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="8-12" />
                                </div>
                            </div>   
                            <div class="columns">
                                <div class="column is-4-desktop is-offset-4-desktop">
                                    <asp:Button ID="Button132" runat="server" OnClick="AnswerButtons_1_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Egal" />
                                </div>
                            </div>                
                            <div class="columns">
                                <h1 class="column has-text-centered is-8-desktop is-offset-2-desktop" style="color: white;font-size: 23px;">Wie wichtig ist dir der Verbauch?</h1>
                            </div>
                            <div class="columns">
                                <div class="column is-8-desktop is-offset-2-desktop">
                                    <div class="columns">
                                        <div class="column">
                                            <asp:Button ID="Button108" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="1" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button109" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="2" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button110" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="3" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button111" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="4" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button112" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="5" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="columns">
                                <div class="column is-2-desktop is-offset-5-desktop">
                                    <asp:Button ID="Button143" runat="server" OnClick="next_Click" CssClass="btn-Next button wow fadeInUp is-fullwidth" Text="Weiter" />
                                </div>
                            </div>
                            <div class="columns">
                                <div class="column is-6-desktop is-offset-3-desktop">
                                    <progress class="progress  " value="204" max="289">70,588235294117647058823529411765%</progress>
                                </div> 
                            </div
                        </asp:View>

                        <asp:View ID="QuestionView_13" runat="server">
                            <div class="columns">
                                <div class=" column is-8-desktop is-offset-2-desktop">
                                    <div class="content" style="height: 50px;">
                                        <h1 class="column title has-text-centered is-8-desktop is-offset-2-desktop" style="color: white;"><%: Session["currentQuestionNumber"] %>. Frage</h1>
                                    </div>                            
                                </div> 
                            </div>
                            <div class="columns">
                                <div class=" column is-8-desktop is-offset-2-desktop">
                                    <div class="content" style="background-color: #EB2121; height: 150px; border: 1px solid white; position:relative;">
                                        <h1 class="title has-text-centered" style="color: white;">Welchen Fahrstil bevorzugst du?</h1>
                                        <div class="tooltip"><i class="large material-icons">info_outline</i>
                                          <span class="tooltiptext">Bitte wähle eine der folgenden Antworten!</span>
                                        </div>  
                                    </div>                            
                                </div>                       
                            </div>
                            <div class="columns">
                                <div class="column is-4-desktop is-offset-2-desktop">
                                    <asp:Button ID="Button133" runat="server" OnClick="AnswerButtons_1_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Komfort" />
                                </div>
                                <div class="column is-4-desktop">
                                    <asp:Button ID="Button136" runat="server" OnClick="AnswerButtons_1_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Sportlichkeit" />
                                </div>
                            </div>
                                
                            </div>
                            <div class="columns">
                                <h1 class="column has-text-centered is-8-desktop is-offset-2-desktop" style="color: white;font-size: 23px;">Wie wichtig ist dir, dass du deinen Fahrstil mit dem Auto ausleben kannst?</h1>
                            </div>
                            <div class="columns">
                                <div class="column is-8-desktop is-offset-2-desktop">
                                    <div class="columns">
                                        <div class="column">
                                            <asp:Button ID="Button124" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="1" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button125" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="2" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button126" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="3" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button127" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="4" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button128" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="5" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="columns">
                                <div class="column is-2-desktop is-offset-5-desktop">
                                    <asp:Button ID="Button148" runat="server" OnClick="next_Click" CssClass="btn-Next button wow fadeInUp is-fullwidth" Text="Weiter" />
                                </div>
                            </div>
                            <div class="columns">
                                <div class="column is-6-desktop is-offset-3-desktop">
                                    <progress class="progress  " value="221" max="289">76,470588235294117647058823529412%</progress>
                                </div> 
                            </div
                        </asp:View>

                        <asp:View ID="QuestionView_14" runat="server">
                            <div class="columns">
                                <div class=" column is-8-desktop is-offset-2-desktop">
                                    <div class="content" style="height: 50px;">
                                        <h1 class="column title has-text-centered is-8-desktop is-offset-2-desktop" style="color: white;"><%: Session["currentQuestionNumber"] %>. Frage</h1>
                                    </div>                            
                                </div> 
                            </div>
                            <div class="columns">
                                <div class=" column is-8-desktop is-offset-2-desktop">
                                    <div class="content" style="background-color: #EB2121; height: 150px; border: 1px solid white; position:relative;">
                                        <h1 class="title has-text-centered" style="color: white;">Welche Antriebsart bevorzugst du?</h1>
                                        <div class="tooltip"><i class="large material-icons">info_outline</i>
                                          <span class="tooltiptext">Bitte wähle eine oder mehrere der folgenden Antworten!</span>
                                        </div>  
                                    </div>                            
                                </div>                       
                            </div>
                            <div class="columns">
                                <div class="column is-8-desktop is-offset-2-desktop">
                                    <div class="columns">
                                        <div class="column">
                                            <asp:Button ID="Button149" runat="server" OnClick="AnswerButtons_List_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Heckantrieb" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button150" runat="server" OnClick="AnswerButtons_List_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Allrad" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button151" runat="server" OnClick="AnswerButtons_List_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Frontantrieb" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                                
                            </div>
                            <div class="columns">
                                <h1 class="column has-text-centered is-8-desktop is-offset-2-desktop" style="color: white;font-size: 23px;">Wie viel Wert legst du auf die Antriebsart?</h1>
                            </div>
                            <div class="columns">
                                <div class="column is-8-desktop is-offset-2-desktop">
                                    <div class="columns">
                                        <div class="column">
                                            <asp:Button ID="Button137" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="1" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button138" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="2" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button139" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="3" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button140" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="4" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button141" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="5" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="columns">
                                <div class="column is-2-desktop is-offset-5-desktop">
                                    <asp:Button ID="Button157" runat="server" OnClick="next_Click" CssClass="btn-Next button wow fadeInUp is-fullwidth" Text="Weiter" />
                                </div>
                            </div>
                            <div class="columns">
                                <div class="column is-6-desktop is-offset-3-desktop">
                                    <progress class="progress  " value="238" max="289">82,352941176470588235294117647059%</progress>
                                </div> 
                            </div
                        </asp:View>

                        <asp:View ID="QuestionView_15" runat="server">
                            <div class="columns">
                                <div class=" column is-8-desktop is-offset-2-desktop">
                                    <div class="content" style="height: 50px;">
                                        <h1 class="column title has-text-centered is-8-desktop is-offset-2-desktop" style="color: white;"><%: Session["currentQuestionNumber"] %>. Frage</h1>
                                    </div>                            
                                </div> 
                            </div>
                            <div class="columns">
                                <div class=" column is-8-desktop is-offset-2-desktop">
                                    <div class="content" style="background-color: #EB2121; height: 150px; border: 1px solid white; position:relative;">
                                        <h1 class="title has-text-centered" style="color: white;">Welches Getriebe möchtest du?</h1>
                                        <div class="tooltip"><i class="large material-icons">info_outline</i>
                                          <span class="tooltiptext">Bitte wähle eine oder mehrere der folgenden Antworten!</span>
                                        </div>  
                                    </div>                            
                                </div>                       
                            </div>
                            <div class="columns">
                                <div class="column is-8-desktop is-offset-2-desktop">
                                    <div class="columns">
                                        <div class="column">
                                            <asp:Button ID="Button158" runat="server" OnClick="AnswerButtons_List_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Handschalter" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button159" runat="server" OnClick="AnswerButtons_List_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Automatik" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button160" runat="server" OnClick="AnswerButtons_List_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Halbautomatik" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                                
                            </div>
                            <div class="columns">
                                <h1 class="column has-text-centered is-8-desktop is-offset-2-desktop" style="color: white;font-size: 23px;">Wie wichtig ist dir, dass dein favorisiertes Getriebe verbaut ist?</h1>
                            </div>
                            <div class="columns">
                                <div class="column is-8-desktop is-offset-2-desktop">
                                    <div class="columns">
                                        <div class="column">
                                            <asp:Button ID="Button142" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="1" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button144" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="2" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button145" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="3" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button146" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="4" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button147" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="5" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="columns">
                                <div class="column is-2-desktop is-offset-5-desktop">
                                    <asp:Button ID="Button166" runat="server" OnClick="next_Click" CssClass="btn-Next button wow fadeInUp is-fullwidth" Text="Weiter" />
                                </div>
                            </div>
                            <div class="columns">
                                <div class="column is-6-desktop is-offset-3-desktop">
                                    <progress class="progress  " value="255" max="289">88,235294117647058823529411764706%</progress>
                                </div> 
                            </div
                        </asp:View>

                        <asp:View ID="QuestionView_16" runat="server">
                            <div class="columns">
                                <div class=" column is-8-desktop is-offset-2-desktop">
                                    <div class="content" style="height: 50px;">
                                        <h1 class="column title has-text-centered is-8-desktop is-offset-2-desktop" style="color: white;"><%: Session["currentQuestionNumber"] %>. Frage</h1>
                                    </div>                            
                                </div> 
                            </div>
                            <div class="columns">
                                <div class=" column is-8-desktop is-offset-2-desktop">
                                    <div class="content" style="background-color: #EB2121; height: 150px; border: 1px solid white; position:relative;">
                                        <h1 class="title has-text-centered" style="color: white;">Wie viel PS soll das Auto haben?</h1>
                                        <div class="tooltip"><i class="large material-icons">info_outline</i>
                                          <span class="tooltiptext">Bitte wähle eine oder mehrere zusammengehörige der folgenden Antworten!</span>
                                        </div>  
                                    </div>                            
                                </div>                       
                            </div>
                            <div class="columns">
                                <div class="column is-8-desktop is-offset-2-desktop">
                                    <div class="columns">
                                        <div class="column">
                                            <asp:Button ID="btn_ans_ps_1" runat="server" OnClick="AnswerButtons_List_String_PS" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="50-80" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="btn_ans_ps_2" runat="server" OnClick="AnswerButtons_List_String_PS" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="81-120" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="btn_ans_ps_3" runat="server" OnClick="AnswerButtons_List_String_PS" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="121-170" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="btn_ans_ps_4" runat="server" OnClick="AnswerButtons_List_String_PS" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="171-220" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="btn_ans_ps_5" runat="server" OnClick="AnswerButtons_List_String_PS" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="221-290" />
                                        </div>
                                    </div>
                                </div>                               
                            </div>
                            <div class="columns">
                                <div class="column is-8-desktop is-offset-2-desktop">
                                    <div class="columns">
                                        <div class="column">
                                            <asp:Button ID="btn_ans_ps_6" runat="server" OnClick="AnswerButtons_List_String_PS" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="291-350" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="btn_ans_ps_7" runat="server" OnClick="AnswerButtons_List_String_PS" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="351-420" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="btn_ans_ps_8" runat="server" OnClick="AnswerButtons_List_String_PS" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="421-500" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="btn_ans_ps_9" runat="server" OnClick="AnswerButtons_List_String_PS" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="500-600" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="btn_ans_ps_10" runat="server" OnClick="AnswerButtons_List_String_PS" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="600+" />
                                        </div>
                                    </div>
                                </div>                               
                            </div>
                            <div class="columns">
                                <h1 class="column has-text-centered is-8-desktop is-offset-2-desktop" style="color: white;font-size: 23px;">Wie wichtig ist dir, dass das Auto in deiner bevorzugten Range liegt?</h1>
                            </div>
                            <div class="columns">
                                <div class="column is-8-desktop is-offset-2-desktop">
                                    <div class="columns">
                                        <div class="column">
                                            <asp:Button ID="Button152" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="1" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button153" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="2" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button154" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="3" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button155" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="4" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button156" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="5" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="columns">
                                <div class="column is-2-desktop is-offset-5-desktop">
                                    <asp:Button ID="Button215" runat="server" OnClick="next_Click" CssClass="btn-Next button wow fadeInUp is-fullwidth" Text="Weiter" />
                                </div>
                            </div>
                            <div class="columns">
                                <div class="column is-6-desktop is-offset-3-desktop">
                                    <progress class="progress  " value="272" max="289">94,117647058823529411764705882353%</progress>
                                </div> 
                            </div
                        </asp:View>

                        <asp:View ID="QuestionView_17" runat="server">
                            <div class="columns">
                                <div class=" column is-8-desktop is-offset-2-desktop">
                                    <div class="content" style="height: 50px;">
                                        <h1 class="column title has-text-centered is-8-desktop is-offset-2-desktop" style="color: white;"><%: Session["currentQuestionNumber"] %>. Frage</h1>
                                    </div>                            
                                </div> 
                            </div>
                            <div class="columns">
                                <div class=" column is-8-desktop is-offset-2-desktop">
                                    <div class="content" style="background-color: #EB2121; height: 150px; border: 1px solid white; position:relative;">
                                        <h1 class="title has-text-centered" style="color: white;">Wie schnell soll das Auto auf 100 km/h beschleunigen?</h1>
                                        <div class="tooltip"><i class="large material-icons">info_outline</i>
                                          <span class="tooltiptext">Bitte wähle eine der folgenden Antworten!</span>
                                        </div>  
                                    </div>                            
                                </div>                       
                            </div>
                            <div class="columns">
                                <div class="column is-8-desktop is-offset-2-desktop">
                                    <div class="columns">
                                        <div class="column">
                                            <asp:Button ID="Button167" runat="server" OnClick="AnswerButtons_1_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="<3" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button168" runat="server" OnClick="AnswerButtons_1_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="3-4" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button169" runat="server" OnClick="AnswerButtons_1_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="4-5" />
                                        </div>
                                    </div>
                                </div>                               
                            </div>
                            <div class="columns">
                                <div class="column is-8-desktop is-offset-2-desktop">
                                    <div class="columns">
                                        <div class="column">
                                            <asp:Button ID="Button170" runat="server" OnClick="AnswerButtons_1_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="5-7" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button171" runat="server" OnClick="AnswerButtons_1_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="7-10" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button172" runat="server" OnClick="AnswerButtons_1_String" CssClass="btn-Answer button wow fadeInUp is-fullwidth" Text="Egal" />
                                        </div>
                                    </div>
                                </div>                               
                            </div>    
                            <div class="columns">
                                <h1 class="column has-text-centered is-8-desktop is-offset-2-desktop" style="color: white;font-size: 23px;">Wie wichtig ist dir die Beschleunigung?</h1>
                            </div>                     
                            <div class="columns">
                                <div class="column is-8-desktop is-offset-2-desktop">
                                    <div class="columns">
                                        <div class="column">
                                            <asp:Button ID="Button161" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="1" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button162" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="2" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button163" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="3" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button164" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="4" />
                                        </div>
                                        <div class="column">
                                            <asp:Button ID="Button165" runat="server" OnClick="ImportanceClick" CssClass="btn-Importance button wow fadeInUp is-fullwidth" Text="5" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="columns">
                                <div class="column is-2-desktop is-offset-5-desktop">
                                    <asp:Button ID="Button181" runat="server" OnClick="next_Click" CssClass="btn-Next button wow fadeInUp is-fullwidth" Text="Weiter" />
                                </div>
                            </div>
                            <div class="columns">
                                <div class="column is-6-desktop is-offset-3-desktop">
                                    <progress class="progress  " value="289" max="306">100%</progress>
                                </div> 
                            </div
                        </asp:View>

                        <asp:View ID="FinishView" runat="server">
                            <div class="columns" style="margin-top: 10%">
                                <div class="column is-6 is-offset-3">
                                    <asp:Button ID="Button210" CssClass="btnFinish" runat="server" OnClick="GetData_Click" Text="Gefundene Autos anzeigen!"/>
                                </div>
                            </div>
                        </asp:View>
                        <asp:View ID="ResultView" runat="server">
	                        <nav class="navbar navbar-default templatemo-nav templatemo-nav navbar-static-top" role="navigation" style="position:fixed; width: 100%; color: white;padding:0px">
		                        <div class="container">
			                        <div class="navbar-header">
				                        <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					                        <span class="icon icon-bar"></span>
				                        </button>
				
				                        <a onclick="navigateToHome()" onfocus="this.blur()" style="background-color: transparent;"
					                        class="btn"><img src="images/logo.png" class="img-responsive" style="display:inline;float:left;"></a>
			                        </div>
		                        </div>
	                        </nav>
	                        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                        </asp:View>
                        
                    </asp:MultiView> 
                </ContentTemplate>
            </asp:UpdatePanel>
</asp:Content>