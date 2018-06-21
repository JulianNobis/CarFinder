using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace prototype
{
    public class Car : IComparable<Car>
    {
        private double score;
        public double Score
        {
            get { return score; }
            set { score = value; }
        }
        private int id;

        public int Id
        {
            get { return id; }
            set { id = value; }
        }

        private string make;

        public string Make
        {
            get { return make; }
            set { make = value; }
        }

        private string model;

        public string Model
        {
            get { return model; }
            set { model = value; }
        }

        private string carType;

        public string CarType
        {
            get { return carType; }
            set { carType = value; }
        }

        private int baseprice;

        public int Baseprice
        {
            get { return baseprice; }
            set { baseprice = value; }
        }

        private int avgSpecPrice;

        public int AvgSpecPrice
        {
            get { return avgSpecPrice; }
            set { avgSpecPrice = value; }
        }

        private string intendedUsecase;

        public string IntendedUsecase
        {
            get { return intendedUsecase; }
            set { intendedUsecase = value; }
        }

        private int seats;

        public int Seats
        {
            get { return seats; }
            set { seats = value; }
        }

        private int seatsWithChildren;

        public int SeatsWithChildren
        {
            get { return seatsWithChildren; }
            set { seatsWithChildren = value; }
        }

        private int trunksize;

        public int Trunksize
        {
            get { return trunksize; }
            set { trunksize = value; }
        }

        private string intendedEnvironment;

        public string IntendedEnvironment
        {
            get { return intendedEnvironment; }
            set { intendedEnvironment = value; }
        }

        private string engineType;

        public string EngineType
        {
            get { return engineType; }
            set { engineType = value; }
        }

        private string engineConstruction;

        public string EngineConstruction
        {
            get { return engineConstruction; }
            set { engineConstruction = value; }
        }

        private float fuelEconomy;

        public float FuelEconomy
        {
            get { return fuelEconomy; }
            set { fuelEconomy = value; }
        }

        private string ridecomfort;

        public string RideComfort
        {
            get { return ridecomfort; }
            set { ridecomfort = value; }
        }

        private string drivetrain;

        public string DriveTrain
        {
            get { return drivetrain; }
            set { drivetrain = value; }
        }

        private string transmission;

        public string Transmission
        {
            get { return transmission; }
            set { transmission = value; }
        }

        private int horsepower;

        public int Horsepower
        {
            get { return horsepower; }
            set { horsepower = value; }
        }

        private float acceleration;

        public float Acceleration
        {
            get { return acceleration; }
            set { acceleration = value; }
        }

        private string imagePath;

        public string ImagePath
        {
            get { return imagePath; }
            set { imagePath = value; }
        }

        public Car(int id, string make, string model, string cartype, int baseprice, int avgSpecPrice, string intendedUsecase, int seats, int seatsWithChildSeatMount, int trunksize, string intendedEnvironment, string engineType, string engineConstruction, float fuelEconomy, string rideComfort, string drivetrain, string transmission, int horsepower, float acceleration, string imagePath)
        {
            Id = id;
            Make = make;
            Model = model;
            CarType = cartype;
            Baseprice = baseprice;
            AvgSpecPrice = avgSpecPrice;
            IntendedUsecase = intendedUsecase;
            Seats = seats;
            SeatsWithChildren = seatsWithChildSeatMount;
            Trunksize = trunksize;
            IntendedEnvironment = intendedEnvironment;
            EngineType = engineType;
            EngineConstruction = engineConstruction;
            FuelEconomy = fuelEconomy;
            RideComfort = rideComfort;
            DriveTrain = drivetrain;
            Transmission = transmission;
            Horsepower = horsepower;
            Acceleration = acceleration;
            ImagePath = imagePath;

        }

        public int CompareTo(Car other)
        {
            return other.score.CompareTo(this.Score);
        }
    }
}