using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace prototype.Model
{
    public class Repository
    {
        private static Repository _instance;
        List<_checkMethod> methods;
        private const int AGE_INDEX = 0;
        private const int GENDER_INDEX = 1;
        private const int BUGET_INDEX = 2;
        private const int PREFCARMAKES_INDEX = 3;
        private const int PREFCARTYPE_INDEX = 4;
        private const int DISLIKEDCARMAKES_INDEX = 5;
        private const int PRIMARYUSECASE_INDEX = 6;
        private const int CHILDREN_INDEX = 7;
        private const int CHILDSEAT_INDEX = 8;
        private const int TRUNCSPACE_INDEX = 9;
        private const int PRIMARYDRIVINGENVIRONMENT_INDEX = 10;
        private const int ENGINTYPE_INDEX = 11;
        private const int CYLINDERCOUNT_INDEX = 12;
        private const int FUELECONOMY_INDEX = 13;
        private const int DRIVINGTYPE_INDEX = 14;
        private const int DRIVETRAIN_INDEX = 15;
        private const int TRANSMISSION_INDEX = 16;
        private const int HORSEPOWER_INDEX = 17;
        private const int ACCELERATION_INDEX = 18;

        private delegate double _checkMethod(Car car, Dictionary<int, Answer> answers);
        private Repository()
        {
            methods = new List<_checkMethod>();
            methods.Add(CheckBudget);
            methods.Add(CheckLikedMakes);
            methods.Add(CheckPrefCarType);
            methods.Add(CheckDislikedMakes);
            methods.Add(CheckPassenger);
            methods.Add(CheckPrimaryUseCase);
            methods.Add(CheckTrunkSpace);
            methods.Add(CheckPrimaryDrivingEnvirnoment);
            methods.Add(CheckEnginTypeAndCylinder);
            methods.Add(CheckFuelEconomy);
            methods.Add(CheckDriveTrain);
            methods.Add(CheckDrivingStyle);
            methods.Add(CheckTransmission);
            methods.Add(CheckHorsePower);
            methods.Add(CheckAcceleration);
        }
        public static Repository GetInstance()
        {
            if (_instance == null)
                _instance = new Repository();
            return _instance;
        }
        public List<Car> ReadAllCarsFromDB()
        {
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\LK\\Desktop\\Projects\\Carfinder\\CarFinder\\CarFinder\\App_Data\\Database2.mdf;Integrated Security=True;Connect Timeout=30";
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            string query = "SELECT * FROM \"Cars\"";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = query;
            cmd.Connection = con;
            SqlDataReader reader = cmd.ExecuteReader();
            List<Car> allCars = new List<Car>();
            while (reader.Read())
            {

                allCars.Add(new Car( 
                    reader.GetInt32(0),
                    reader.GetString(1),
                    reader.GetString(2),
                    reader.GetString(3),
                    reader.GetInt32(4),
                    reader.GetInt32(5),
                    reader.GetString(6),
                    reader.GetInt32(7),
                    reader.GetInt32(8),
                    reader.GetInt32(9),
                    reader.GetString(10),
                    reader.GetString(11),
                    reader.GetString(12),
                    (float)reader.GetDouble(13),
                    reader.GetString(14),
                    reader.GetString(15),
                    reader.GetString(16),
                    reader.GetInt32(17),
                    (float)reader.GetDouble(18),
                    reader.GetString(19)
                    ));
            }
            return allCars;
        }
        public Advertisement getRandomAdvertisement(int carID)
        {
            List<Advertisement> list = new List<Advertisement>();
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\LK\\Desktop\\Projects\\Carfinder\\CarFinder\\CarFinder\\App_Data\\Database2.mdf;Integrated Security=True;Connect Timeout=30";
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            string query = "SELECT * FROM \"Ads\" where \"carID\" = " + carID;
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = query;
            cmd.Connection = con;
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                list.Add(new Advertisement(reader.GetInt32(4), reader.GetString(1), reader.GetString(2), reader.GetInt32(3)));
            }
            if (list.Count == 0)
            {
                return null;
            }
            else
            {
                Random random = new Random();
                int r = random.Next(0, list.Count - 1);
                return list[r];
            }
        }
        public double MaximumScore(Dictionary<int, Answer> answers)
        {
            Dictionary<int, double> tempAnswers = new Dictionary<int, double>();
            foreach(KeyValuePair<int, Answer> kvp in answers)
            {
                double imp = (double)kvp.Value.Importance();
                tempAnswers.Add(kvp.Key, imp);
            }
            if (!tempAnswers.ContainsKey(FUELECONOMY_INDEX))
            {
                tempAnswers.Remove(FUELECONOMY_INDEX);
            }
            else
            {
                Answer_1_String ans = answers[FUELECONOMY_INDEX] as Answer_1_String;
                String ui = ans.AnswerValue().ToString();
                if (ui == "Egal")
                    tempAnswers.Remove(FUELECONOMY_INDEX);
            }
            if(!answers.ContainsKey(CYLINDERCOUNT_INDEX))
            {
                tempAnswers.Remove(CYLINDERCOUNT_INDEX);
            }
            else
            {
                Answer_List_String cylinderAnswer = answers[CYLINDERCOUNT_INDEX] as Answer_List_String;
                List<String> answerValue = cylinderAnswer.AnswerValue() as List<String>;
                if (answerValue.Contains("Nein"))
                {
                    tempAnswers.Remove(CYLINDERCOUNT_INDEX);
                }    
            }
            if (!answers.ContainsKey(CHILDSEAT_INDEX))
            {
                tempAnswers.Remove(CHILDSEAT_INDEX);
            }
            else
            {
                Answer_1_String childSeatAnswer = null;
                childSeatAnswer = answers[CHILDSEAT_INDEX] as Answer_1_String;
                String childSeatAnswerValue = childSeatAnswer.AnswerValue().ToString();
                if (childSeatAnswerValue == "Nein")
                    tempAnswers.Remove(CHILDSEAT_INDEX);
            }
            Answer_1_String answer = answers[BUGET_INDEX] as Answer_1_String;
            String userInput = answer.AnswerValue().ToString();
            if (userInput == "Egal")
                tempAnswers.Remove(BUGET_INDEX);
            answer = answers[ACCELERATION_INDEX] as Answer_1_String;           
            userInput = answer.AnswerValue().ToString();
            if (userInput == "Egal")
                tempAnswers.Remove(ACCELERATION_INDEX);
            double temp = 0;
            foreach(double a in tempAnswers.Values)
            {
                double imp = (double)a / 5.0;
                temp += imp;
            }
            return temp;
        }
        public List<Car> FindCar(List<Car> allCars, Dictionary<int, Answer> answers)
        {
            Car temp = allCars[0];
            double currentCarScore = CheckCar(allCars[0], answers);
            allCars[0].Score = currentCarScore;
            double maxCarScore = currentCarScore;    
            double maximumScore = this.MaximumScore(answers);
            for (int i = 1; i < allCars.Count; i++)
            {
                currentCarScore = CheckCar(allCars[i], answers);
                allCars[i].Score = currentCarScore;
            }
            allCars.Sort();
            return allCars.GetRange(0, 3);

        }
        public double CheckCar(Car car, Dictionary<int, Answer> answers)
        {
            double rating = 0;
            foreach (_checkMethod f in methods)
            {
                rating += f(car, answers);
            }
            return rating;
        }
        public double CheckAcceleration(Car car, Dictionary<int, Answer> answers)
        {
            Answer_1_String answer = answers[ACCELERATION_INDEX] as Answer_1_String;
            double rating;
            double importance = ((double)answer.Importance()) / 5.0;
            String userInput = answer.AnswerValue().ToString();

            double lowerRange;
            double lower;
            double upperRange;
            double upper;

            if (userInput == "Egal")
                return 0.0;
            else if(userInput == "<3")
            {
                lowerRange = 1.0;
                upperRange = 3.0; 
            }
            else
            {
                String[] elements = userInput.Split('-');
                lowerRange = Double.Parse(elements[0]);
                upperRange = Double.Parse(elements[1]);
            }

            lower = lowerRange - 1;
            upper = upperRange + 2;
            


            double x = car.Horsepower;

            if (x <= lower)
            {
                rating = 0;
            }
            else if (x > lower && x < lowerRange)
            {
                rating = 1 / (lowerRange - lower) * (x - lower);
            }
            else if (x >= lowerRange && x <= upperRange)
            {
                rating = 1;
            }
            else if (x > upperRange && x <= upper)
            {
                rating = -1 / (upper - upperRange) * (x - upperRange) + 1;
            }
            else
            {
                rating = 0;
            }
            return rating * importance;
        }
        public double CheckHorsePower(Car car, Dictionary<int, Answer> answers)
        {
            Answer_List_String answer = answers[HORSEPOWER_INDEX] as Answer_List_String;
            List<String> answerValue = answer.AnswerValue() as List<String>;
            double rating;
            double importance = ((double)answer.Importance()) / 5.0;

            double upperRange;
            double upper;
            double lowerRange;
            double lower;

            //ToDo: Handle if answer is 600+
            if(answerValue[0] == "600+")
            {
                lowerRange = 600;
                upperRange = 100000;
            }
            else
            {
                string[] elements = answerValue[0].Split('-');
                lowerRange = Double.Parse(elements[0]);
                upperRange = Double.Parse(elements[1]);
            }


            for (int i = 1;i<answerValue.Count;i++)
            {
                string s = answerValue[i];
                double tempLower;
                double tempUpper;
                if (s == "600+")
                {
                    tempLower = 600;
                    tempUpper = 100000;
                }
                else
                {
                    string [] elements = s.Split('-');
                    tempLower = Double.Parse(elements[0]);
                    tempUpper = Double.Parse(elements[1]);
                }                
                if (tempLower < lowerRange)
                    lowerRange = tempLower;
                if (tempUpper > upperRange)
                    upperRange = tempUpper;
            }

            lower = lowerRange * 0.8;
            upper = upperRange * 1.2;
            

            double x = car.Horsepower;

            if (x <= lower)
            {
                rating = 0;
            }
            else if (x > lower && x < lowerRange)
            {
                rating = 1 / (lowerRange - lower) * (x - lower);
            }
            else if (x >= lowerRange && x <= upperRange)
            {
                rating = 1;
            }
            else if (x > upperRange && x <= upper)
            {
                rating = -1 / (upper - upperRange) * (x - upperRange) + 1;
            }
            else
            {
                rating = 0;
            }
            return rating * importance;
        }
        public double CheckDriveTrain(Car car, Dictionary<int, Answer> answers)
        {
            Answer_List_String answer = answers[DRIVETRAIN_INDEX] as Answer_List_String;
            List<String> answerValue = answer.AnswerValue() as List<String>;

            double rating;
            double importance = ((double)answer.Importance()) / 5.0;

            if (answerValue.Contains(car.DriveTrain))
                rating = 1.0;
            else
                rating = 0.0;

            return rating * importance;

        }
        public double CheckTransmission(Car car, Dictionary<int, Answer> answers)
        {
            Answer_List_String answer = answers[TRANSMISSION_INDEX] as Answer_List_String;
            List<String> answerValue = answer.AnswerValue() as List<String>;

            double rating;
            double importance = ((double)answer.Importance()) / 5.0;

            if (answerValue.Contains(car.Transmission))
                rating = 1.0;
            else
                rating = 0.0;

            return rating * importance;
        }
        public double CheckDrivingStyle(Car car, Dictionary<int, Answer> answers)
        {
            Answer_1_String answer = answers[DRIVINGTYPE_INDEX] as Answer_1_String;
            double rating = 0.0;
            double importance = ((double)answer.Importance()) / 5.0;
            String userInput = answer.AnswerValue().ToString();

            if (car.RideComfort == userInput)
                rating = 1.0;

            return importance * rating;

        }
        public double CheckFuelEconomy(Car car, Dictionary<int, Answer> answers)
        {
            if (!answers.ContainsKey(FUELECONOMY_INDEX))
                return 0.0;
            Answer_1_String answer = answers[FUELECONOMY_INDEX] as Answer_1_String;
            double rating;
            double importance = ((double)answer.Importance()) / 5.0;
            String userInput = answer.AnswerValue().ToString();

            if (userInput == "Egal")
                return 0.0;

            String[] elements = userInput.Split('-');

            double lowerRange = Double.Parse(elements[0]);
            double lower = lowerRange - 1;
            double upperRange = Double.Parse(elements[1]);
            double upper = upperRange + 1;

            double x = car.FuelEconomy;

            if (x <= lower)
            {
                rating = 0;
            }
            else if (x > lower && x < lowerRange)
            {
                rating = 1 / (lowerRange - lower) * (x - lower);
            }
            else if (x >= lowerRange && x <= upperRange)
            {
                rating = 1;
            }
            else if (x > upperRange && x <= upper)
            {
                rating = -1 / (upper - upperRange) * (x - upperRange) + 1;
            }
            else
            {
                rating = 0;
            }
            return rating * importance;
        }
        public double CheckEnginTypeAndCylinder(Car car, Dictionary<int, Answer> answers)
        {
            Answer_1_String answer = answers[PRIMARYDRIVINGENVIRONMENT_INDEX] as Answer_1_String;
            double rating;
            double importance = ((double) answer.Importance()) / 5.0;
            String userInput = answer.AnswerValue().ToString();

            if (userInput == car.EngineType)
                rating = 1.0;
            else
                rating = 0.0;

            double currentRating = rating * importance;
            double possibleCylinderRating = 0.0;

            if(answers.ContainsKey(CYLINDERCOUNT_INDEX))
            {
                Answer_List_String cylinderAnswer = answers[CYLINDERCOUNT_INDEX] as Answer_List_String;
                List<String> answerValue = cylinderAnswer.AnswerValue() as List<String>;

                rating = 0.0;
                importance = (double)cylinderAnswer.Importance()/5.0;

                if(answerValue.Contains(car.EngineConstruction))
                {
                    rating = 1.0;
                }

                possibleCylinderRating = rating * importance;

            }

            return currentRating + possibleCylinderRating;
        }
        public double CheckPrimaryDrivingEnvirnoment(Car car, Dictionary<int, Answer> answers)
        {
            Answer_1_String answer = answers[PRIMARYDRIVINGENVIRONMENT_INDEX] as Answer_1_String;
            double rating;
            double importance = ((double)answer.Importance()) / 5.0;
            String userInput = answer.AnswerValue().ToString();

            if (userInput == car.IntendedEnvironment)
                rating = 1.0;
            else
                rating = 0.0;

            return rating * importance;
        }
        public double CheckPassenger(Car car, Dictionary<int, Answer> answers)
        {
            Answer_1_String passengerAnswer = answers[CHILDREN_INDEX] as Answer_1_String;
            Answer_1_String childSeatAnswer = null;
            if(answers.ContainsKey(CHILDSEAT_INDEX))
            {
                childSeatAnswer = answers[CHILDSEAT_INDEX] as Answer_1_String;
            }

            String passengerAnswerValue = passengerAnswer.AnswerValue().ToString();
            double passengerRating;
            double passengerImportance = ((double)passengerAnswer.Importance()) / 5.0;

            int wantedSeats;

           

            if(passengerAnswerValue == "Nein")
            {
                if (car.Seats <= 2)
                    passengerRating = 1.0;
                else if (car.Seats > 2 && car.Seats <= 4)
                    passengerRating = -1.0 / 2.0 * ((double)(car.Seats - 2)) + 1.0;
                else
                    passengerRating = 0;

                return passengerRating * passengerImportance;
            }
            else if(passengerAnswerValue == "3+")
            {
                wantedSeats = 5;
            }
            else
            {
                wantedSeats = Int16.Parse(passengerAnswerValue) + 1;
            }

            if(car.Seats < (wantedSeats-1))
            {
                passengerRating = 0;
            }
            else if(car.Seats == (wantedSeats - 1))
            {
                passengerRating = 1 / 10;
            }
            else
            {
                passengerRating = 1;
            }

            double currentRating = passengerRating * passengerImportance;


            double possibleAttachedRating = 0;
            if(childSeatAnswer != null)
            {
                double childSeatRating;
                double childSeatImportance = ((double)childSeatAnswer.Importance()) / 5.0;

                String childSeatAnswerValue = childSeatAnswer.AnswerValue().ToString();
                if (childSeatAnswerValue == "Nein")
                    childSeatRating = 0;
                else
                {
                    if (car.SeatsWithChildren > 1)
                        childSeatRating = 1;
                    else
                        childSeatRating = 0;

                }

                possibleAttachedRating = childSeatRating * childSeatImportance;

            }

            return currentRating + possibleAttachedRating;
        }
        public double CheckTrunkSpace(Car car, Dictionary<int, Answer> answers)
        {
            Answer_1_String answer = answers[TRUNCSPACE_INDEX] as Answer_1_String;
            double rating;
            double importance = ((double)answer.Importance()) / 5.0;
            String userInput = answer.AnswerValue().ToString();

            //Klein : x < 300
            //Mittel: 300 <= x <= 430
            //Groß: x > 430

            double x = car.Trunksize;

            double lower;
            double lowerRange;
            double upper;
            double upperRange;
            if(userInput == "Klein")
            {
                lowerRange = 0;
                upperRange = 300;
                lower = lowerRange;
                upper = upperRange * 1.3;
            }
            else if (userInput == "Mittel")
            {
                lowerRange = 300;
                upperRange = 430;
                lower = lowerRange * 0.85;
                upper = upperRange * 1.3;
            }
            else
            {
                lowerRange = 430;
                upperRange = 700;
                lower = lowerRange * 0.85;
                upper = upperRange;
            }

            if (x <= lower)
            {
                rating = 0;
            }
            else if (x > lower && x < lowerRange)
            {
                rating = 1 / (lowerRange - lower) * (x - lower);
            }
            else if (x >= lowerRange && x <= upperRange)
            {
                rating = 1;
            }
            else if (x > upperRange && x <= upper)
            {
                rating = -1 / (upper - upperRange) * (x - upperRange) + 1;
            }
            else
            {
                rating = 0;
            }
            return rating * importance;
        }
        public double CheckPrimaryUseCase(Car car, Dictionary<int, Answer> answers)
        {
            Answer_1_String answer = answers[PRIMARYUSECASE_INDEX] as Answer_1_String;
            double rating;
            double importance = ((double)answer.Importance()) / 5.0;
            String userInput = answer.AnswerValue().ToString();

            if (userInput == car.IntendedUsecase)
                rating = 1;
            else
                rating = 0;

            return rating * importance;
        }
        public double CheckPrefCarType(Car car, Dictionary<int, Answer> answers)
        {
            Answer_List_String answer = answers[PREFCARTYPE_INDEX] as Answer_List_String;
            List<String> answerValue = answer.AnswerValue() as List<String>;

            double rating;
            double importance = ((double)answer.Importance()) / 5.0;

            if (answerValue.Contains(car.CarType))
                rating = 1.0;
            else
                rating = 0;

            return rating * importance;

        }
        public double CheckLikedMakes(Car car, Dictionary<int, Answer> answers)
        {
            Answer_List_String answer = answers[PREFCARMAKES_INDEX] as Answer_List_String;
            List<String> answerValue = answer.AnswerValue() as List<String>;

            double rating;
            double importance = ((double)answer.Importance()) / 5.0;

            if (answerValue.Contains(car.Make))
                rating = 1.0;
            else
                rating = 0;

            return rating * importance;

        }
        public double CheckDislikedMakes(Car car, Dictionary<int, Answer> answers)
        {
            Answer_List_String answer = answers[DISLIKEDCARMAKES_INDEX] as Answer_List_String;
            List<String> answerValue = answer.AnswerValue() as List<String>;

            double rating;
            double importance = ((double)answer.Importance()) / 5.0;

            if (!answerValue.Contains(car.Make))
                rating = 1.0;
            else
                rating = 0;

            return rating * importance;

        }
        public double CheckBudget(Car car, Dictionary<int, Answer> answers)
        {
            Answer_1_String answer = answers[BUGET_INDEX] as Answer_1_String;
            double rating;
            double importance = ((double)answer.Importance()) / 5.0;

            String userInput = answer.AnswerValue().ToString();
            if (userInput == "Egal")
                return 0.0;

            double maxBudget = Double.Parse(userInput);
            double lowerPriceRange = maxBudget * 0.67;
            double upperPriceRange = maxBudget * 1.1;

            double x = car.AvgSpecPrice;

            if(x < lowerPriceRange)
            {
                rating = 0;
            }
            else if(x >= lowerPriceRange && x < maxBudget)
            {
                rating = (1 / (maxBudget - lowerPriceRange))  * ((double)(x- lowerPriceRange));
            }
            else if(x >= maxBudget && x < upperPriceRange)
            {
                rating = (-1 / ((double)(upperPriceRange - maxBudget)) * ((double)(x-maxBudget) ))+ 1;
            }
            else
            {
                rating = 0;
            }

            return rating * importance;
        }
        public void StoreSearchQuery(Dictionary<int, Answer> answers)
        {

            //For Mysql: auto_increment statt identity
            string connetionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\LK\\Desktop\\Projects\\Carfinder\\CarFinder\\CarFinder\\App_Data\\Database2.mdf;Integrated Security=True;Connect Timeout=30";
            string sql = null;            
            using (SqlConnection cnn = new SqlConnection(connetionString))
            {
                sql = "insert into SearchQueries(" + 
                                "Age, "+
                                "Gender, "+
                                "MaxBudget, MaxBudgetImportance, "+
                                "PrefMakes, PrefMakesImportance, "+
                                "PrefCarType, PrefCarTypeImportance, "+
                                "DislikedMakes, DislikedMakesImportance, "+
                                "PrimaryUsecase, PrimaryUsecaseImportance, "+
                                "Children, ChildrenImportance, "+
                                "ChildSeat, ChildSeatImportance, "+
                                "TrunkSpace, TrunkSpaceImportance, "+
                                "PrimaryDrivingEnvironment, PrimaryDrivingEnvironmentImportance, "+
                                "PrefEnginType, PrefEnginTypeImportance, "+
                                "PrefCylinderCount, PrefCylinderCountImportance, "+
                                "FuelEconomy, FuelEconomyImportance, "+
                                "PrefDrivingStyle, PrefDrivingStyleImportance, "+
                                "PrefDrivetrainType, PrefDrivetrainTypeImportance, "+
                                "PrefTransmission, PrefTransmissionImportance, "+
                                "HorsePower, HorsePowerImportance,  "+
                                "Acceleration, AccelerationImportance) "+
                        "values("+
                                "@Age,"+
                                "@Gender,"+
                                "@MaxBudget, @MaxBudgetImportance, "+
                                "@PrefMakes, @PrefMakesImportance, "+
                                "@PrefCarType, @PrefCarTypeImportance, "+
                                "@DislikedMakes, @DislikedMakesImportance, "+
                                "@PrimaryUsecase, @PrimaryUsecaseImportance, "+
                                "@Children, @ChildrenImportance, "+
                                "@ChildSeat, @ChildSeatImportance, "+
                                "@TrunkSpace, @TrunkSpaceImportance, "+
                                "@PrimaryDrivingEnvironment, @PrimaryDrivingEnvironmentImportance, "+
                                "@PrefEnginType, @PrefEnginTypeImportance, "+
                                "@PrefCylinderCount, @PrefCylinderCountImportance, "+
                                "@FuelEconomy, @FuelEconomyImportance, "+
                                "@PrefDrivingStyle, @PrefDrivingStyleImportance, "+
                                "@PrefDrivetrainType, @PrefDrivetrainTypeImportance, "+
                                "@PrefTransmission, @PrefTransmissionImportance, "+
                                "@HorsePower, @HorsePowerImportance, "+
                                "@Acceleration, @AccelerationImportance)";
                cnn.Open();
                using (SqlCommand cmd = new SqlCommand(sql, cnn))
                {
                    
                    
                    cmd.Parameters.AddWithValue("@Age", (answers[AGE_INDEX] as Answer_1_String).AnswerValue().ToString());

                    cmd.Parameters.AddWithValue("@Gender", (answers[GENDER_INDEX] as Answer_1_String).AnswerValue().ToString());

                    cmd.Parameters.AddWithValue("@MaxBudget", (answers[BUGET_INDEX] as Answer_1_String).AnswerValue().ToString());
                    cmd.Parameters.AddWithValue("@MaxBudgetImportance", (answers[BUGET_INDEX] as Answer_1_String).Importance());

                    cmd.Parameters.AddWithValue("@PrefMakes", GetConcatenatedString((answers[PREFCARMAKES_INDEX] as Answer_List_String).AnswerValue() as List<String>));
                    cmd.Parameters.AddWithValue("@PrefMakesImportance", (answers[PREFCARMAKES_INDEX] as Answer_List_String).Importance());

                    cmd.Parameters.AddWithValue("@PrefCarType", GetConcatenatedString((answers[PREFCARTYPE_INDEX] as Answer_List_String).AnswerValue() as List<String>));
                    cmd.Parameters.AddWithValue("@PrefCarTypeImportance", (answers[PREFCARTYPE_INDEX] as Answer_List_String).Importance());

                    cmd.Parameters.AddWithValue("@DislikedMakes", GetConcatenatedString((answers[DISLIKEDCARMAKES_INDEX] as Answer_List_String).AnswerValue() as List<String>));
                    cmd.Parameters.AddWithValue("@DislikedMakesImportance", (answers[DISLIKEDCARMAKES_INDEX] as Answer_List_String).Importance());

                    cmd.Parameters.AddWithValue("@PrimaryUsecase", (answers[PRIMARYUSECASE_INDEX] as Answer_1_String).AnswerValue().ToString());
                    cmd.Parameters.AddWithValue("@PrimaryUsecaseImportance", (answers[PRIMARYUSECASE_INDEX] as Answer_1_String).Importance());

                    cmd.Parameters.AddWithValue("@Children", (answers[CHILDREN_INDEX] as Answer_1_String).AnswerValue().ToString());
                    cmd.Parameters.AddWithValue("@ChildrenImportance", (answers[CHILDREN_INDEX] as Answer_1_String).Importance());

                    if(answers.ContainsKey(CHILDSEAT_INDEX))
                    {
                        cmd.Parameters.AddWithValue("@ChildSeat", (answers[CHILDSEAT_INDEX] as Answer_1_String).AnswerValue().ToString());
                        cmd.Parameters.AddWithValue("@ChildSeatImportance", (answers[CHILDSEAT_INDEX] as Answer_1_String).Importance());
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@ChildSeat", "Kein Kindersitz Notwendig");
                        cmd.Parameters.AddWithValue("@ChildSeatImportance", "0");
                    }

                    cmd.Parameters.AddWithValue("@TrunkSpace", (answers[TRUNCSPACE_INDEX] as Answer_1_String).AnswerValue().ToString());
                    cmd.Parameters.AddWithValue("@TrunkSpaceImportance", (answers[TRUNCSPACE_INDEX] as Answer_1_String).Importance());
                                       
                    cmd.Parameters.AddWithValue("@PrimaryDrivingEnvironment", (answers[PRIMARYDRIVINGENVIRONMENT_INDEX] as Answer_1_String).AnswerValue().ToString());
                    cmd.Parameters.AddWithValue("@PrimaryDrivingEnvironmentImportance", (answers[PRIMARYDRIVINGENVIRONMENT_INDEX] as Answer_1_String).Importance());

                    cmd.Parameters.AddWithValue("@PrefEnginType", GetConcatenatedString((answers[ENGINTYPE_INDEX] as Answer_List_String).AnswerValue() as List<String>));
                    cmd.Parameters.AddWithValue("@PrefEnginTypeImportance", (answers[ENGINTYPE_INDEX] as Answer_List_String).Importance());

                    if (answers.ContainsKey(CYLINDERCOUNT_INDEX))
                    {
                        cmd.Parameters.AddWithValue("@PrefCylinderCount", GetConcatenatedString((answers[CYLINDERCOUNT_INDEX] as Answer_List_String).AnswerValue() as List<String>));
                        cmd.Parameters.AddWithValue("@PrefCylinderCountImportance", (answers[CYLINDERCOUNT_INDEX] as Answer_List_String).Importance());
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@PrefCylinderCount", "");
                        cmd.Parameters.AddWithValue("@PrefCylinderCountImportance", 0);
                    }

                    if (answers.ContainsKey(FUELECONOMY_INDEX))
                    {
                        cmd.Parameters.AddWithValue("@FuelEconomy", (answers[FUELECONOMY_INDEX] as Answer_1_String).AnswerValue().ToString());
                        cmd.Parameters.AddWithValue("@FuelEconomyImportance", (answers[FUELECONOMY_INDEX] as Answer_1_String).Importance());
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@FuelEconomy", 0.0);
                        cmd.Parameters.AddWithValue("@FuelEconomyImportance", 0);
                    }                    

                    cmd.Parameters.AddWithValue("@PrefDrivingStyle", (answers[DRIVINGTYPE_INDEX] as Answer_1_String).AnswerValue().ToString());
                    cmd.Parameters.AddWithValue("@PrefDrivingStyleImportance", (answers[DRIVINGTYPE_INDEX] as Answer_1_String).Importance());

                    cmd.Parameters.AddWithValue("@PrefDrivetrainType", GetConcatenatedString((answers[DRIVETRAIN_INDEX] as Answer_List_String).AnswerValue() as List<String>));
                    cmd.Parameters.AddWithValue("@PrefDrivetrainTypeImportance", (answers[DRIVETRAIN_INDEX] as Answer_List_String).Importance());

                    cmd.Parameters.AddWithValue("@PrefTransmission", GetConcatenatedString((answers[TRANSMISSION_INDEX] as Answer_List_String).AnswerValue() as List<String>));
                    cmd.Parameters.AddWithValue("@PrefTransmissionImportance", (answers[TRANSMISSION_INDEX] as Answer_List_String).Importance());

                    cmd.Parameters.AddWithValue("@HorsePower", GetConcatenatedString((answers[HORSEPOWER_INDEX] as Answer_List_String).AnswerValue() as List<String>));
                    cmd.Parameters.AddWithValue("@HorsePowerImportance", (answers[HORSEPOWER_INDEX] as Answer_List_String).Importance());
                    
                    cmd.Parameters.AddWithValue("@Acceleration", (answers[ACCELERATION_INDEX] as Answer_1_String).AnswerValue().ToString());
                    cmd.Parameters.AddWithValue("@AccelerationImportance", (answers[ACCELERATION_INDEX] as Answer_1_String).Importance());


                    cmd.ExecuteNonQuery();
                }
            }
        }
        private String GetConcatenatedString(List<String> list)
        {
            string retval = "";
            for(int i = 0;i<list.Count;i++)
            {
                retval += list[i] + ";";
            }
            return retval.Substring(0, retval.Length-1);
        }
    }
}