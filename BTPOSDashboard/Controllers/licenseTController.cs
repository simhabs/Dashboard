﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Data;
using System.Data.SqlClient;

namespace BTPOSDashboard.Controllers
{
    public class licenseTController : ApiController
    {
        [HttpGet]
        public DataTable getLicenseDetails()
        {
            DataTable Tbl = new DataTable();


            //connect to database
            SqlConnection conn = new SqlConnection();
            //connetionString="Data Source=ServerName;Initial Catalog=DatabaseName;User ID=UserName;Password=Password"
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "GetLicenseDetails";
            cmd.Connection = conn;

            //SqlParameter Gid = new SqlParameter();
            //Gid.ParameterName = "@ltypeId";
            //Gid.SqlDbType = SqlDbType.Int;
            //Gid.Value = catId;
            //cmd.Parameters.Add(Gid);


            SqlDataAdapter db = new SqlDataAdapter(cmd);
            db.Fill(Tbl);


            // int found = 0;
            return Tbl;
        }

    }
}
