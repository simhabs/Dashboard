﻿using BTPOSDashboardAPI.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace BTPOSDashboard.Controllers
{
    public class FleetOwnerRouteController : ApiController
    {
        [HttpGet]
        public DataTable getFleetOwnerRoute()
        {
            DataTable Tbl = new DataTable();


            //connect to database
            SqlConnection conn = new SqlConnection();
            //connetionString="Data Source=ServerName;Initial Catalog=DatabaseName;User ID=UserName;Password=Password"
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "GetFleetOwnerRoute";
            cmd.Connection = conn;
            DataSet ds = new DataSet();
            SqlDataAdapter db = new SqlDataAdapter(cmd);
            db.Fill(ds);
            Tbl = ds.Tables[0];

            // int found = 0;
            return Tbl;
        }
        [HttpPost]
        public DataTable saveFleetOwnerRoute(FleetownerRoute b)
        {
            DataTable Tbl = new DataTable();


            //connect to database
            SqlConnection conn = new SqlConnection();
            //connetionString="Data Source=ServerName;Initial Catalog=DatabaseName;User ID=UserName;Password=Password"
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "GetFleetOwnerRouterss";
            cmd.Connection = conn;
            conn.Open();
            SqlParameter cc = new SqlParameter();
            cc.ParameterName = "@Id";
            cc.SqlDbType = SqlDbType.Int;
            cc.Value = b.Id;
            SqlParameter ccd = new SqlParameter();
            ccd.ParameterName = "@FleetOwnerId";
            ccd.SqlDbType = SqlDbType.Int;
            ccd.Value = Convert.ToString(b.FleetOwnerId);
            cmd.Parameters.Add(ccd);
         
            SqlParameter ccds = new SqlParameter();
            ccds.ParameterName = "@CompanyId";
            ccds.SqlDbType = SqlDbType.Int;
            ccds.Value = Convert.ToString(b.CompanyId);
            cmd.Parameters.Add(ccds);
            SqlParameter ccdsa = new SqlParameter();
            ccdsa.ParameterName = "@CompanyName";
            ccdsa.SqlDbType = SqlDbType.Int;
            ccdsa.Value = Convert.ToString(b.RouteId);
            cmd.Parameters.Add(ccdsa);

            SqlParameter dd = new SqlParameter();
            dd.ParameterName = "@FleetOwnerName ";
            dd.SqlDbType = SqlDbType.VarChar;
            dd.Value = b.From;
            cmd.Parameters.Add(dd);

            SqlParameter d1 = new SqlParameter();
            d1.ParameterName = "@From ";
            d1.SqlDbType = SqlDbType.VarChar;
            d1.Value = b.From;
            cmd.Parameters.Add(d1);

            SqlParameter d2 = new SqlParameter();
            d2.ParameterName = "@To ";
            d2.SqlDbType = SqlDbType.VarChar;
            d2.Value = b.From;
            cmd.Parameters.Add(d2);
           
            SqlParameter aa = new SqlParameter();
            aa.ParameterName = "@Active";
            aa.SqlDbType = SqlDbType.VarChar;
            aa.Value = b.Active;
            cmd.Parameters.Add(aa);


            //DataSet ds = new DataSet();
            //SqlDataAdapter db = new SqlDataAdapter(cmd);
            //db.Fill(ds);
            // Tbl = Tables[0];
            cmd.ExecuteScalar();
            conn.Close();
            // int found = 0;
            return Tbl;
        }
        public void Options()
        {

        }
    }
}
