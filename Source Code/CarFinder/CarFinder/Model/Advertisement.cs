using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace prototype
{
    public class Advertisement
    {
        private int carID;
        private string carDealer;
        private string link;
        private int price;

        public int CarID
        {
            get
            {
                return carID;
            }

            set
            {
                carID = value;
            }
        }

        public string CarDealer
        {
            get
            {
                return carDealer;
            }

            set
            {
                carDealer = value;
            }
        }

        public string Link
        {
            get
            {
                return link;
            }

            set
            {
                link = value;
            }
        }

        public int Price
        {
            get
            {
                return price;
            }

            set
            {
                price = value;
            }
        }

        public Advertisement(int cID, string cD, string l, int p)
        {
            CarID = cID;
            CarDealer = cD;
            Link = l;
            Price = p;
        }
    }
}