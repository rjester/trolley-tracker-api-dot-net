﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Runtime.Serialization;
using TrolleyTracker.Models;

namespace TrolleyTracker.ViewModels
{
    [DataContract(Name = "StopSummary")]
    public class StopSummary
    {
        public StopSummary(Stop stop)
        {
            this.ID = stop.ID;
            this.Name = stop.Name;
            this.Description = stop.Description;
            this.Lat = stop.Lat;
            this.Lon = stop.Lon;

        }


        [DataMember]
        public int ID { get; set; }
        [DataMember]
        public string Name { get; set; }
        [DataMember]
        public string Description { get; set; }
        [DataMember]
        public double Lat { get; set; }
        [DataMember]
        public double Lon { get; set; }
    }
}