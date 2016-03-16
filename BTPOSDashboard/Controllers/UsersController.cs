﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using BTPOSDashboardAPI.Models;

namespace BTPOSDashboardAPI.Controllers
{
    public class UsersController : ApiController
    {
        [HttpGet]
        public DataTable GetUsers()//Main Method
        {


            DataTable Tbl = new DataTable();
            //connect to database
            SqlConnection conn = new SqlConnection();
            //connetionString="Data Source=ServerName;Initial Catalog=DatabaseName;User ID=UserName;Password=Password"
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();
            //conn.ConnectionString = "Data Source=localhost;Initial Catalog=MyAlerts;integrated security=sspi;";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;//Stored Procedure
            cmd.CommandText = "GetUsers";
            cmd.Connection = conn;
            DataSet ds = new DataSet();
            SqlDataAdapter db = new SqlDataAdapter(cmd);
            db.Fill(ds);
            Tbl = ds.Tables[0];

            // int found = 0;
            return Tbl;
        }
        [HttpPost]
        public DataTable SaveUsers(Users U)
        {
            DataTable Tbl = new DataTable();
            try
            {

                //connect to database
                SqlConnection conn = new SqlConnection();
                //connetionString="Data Source=ServerName;Initial Catalog=DatabaseName;User ID=UserName;Password=Password"
                conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();
                //conn.ConnectionString = "Data Source=localhost;Initial Catalog=MyAlerts;integrated security=sspi;";
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "insUsers";
                cmd.Connection = conn;
                conn.Open();


                SqlParameter UId = new SqlParameter();
                UId.ParameterName = "@Id";
                UId.SqlDbType = SqlDbType.Int;
                UId.Value = Convert.ToString(U.Id);
                cmd.Parameters.Add(UId);

                SqlParameter UFirstName = new SqlParameter();
                UFirstName.ParameterName = "@FirstName";
                UFirstName.SqlDbType = SqlDbType.VarChar;
                UFirstName.Value = U.FirstName;
                cmd.Parameters.Add(UFirstName);

                SqlParameter LastName = new SqlParameter();
                LastName.ParameterName = "@LastName";
                LastName.SqlDbType = SqlDbType.VarChar;
                LastName.Value = U.LastName;
                cmd.Parameters.Add(LastName);

                SqlParameter UUserType = new SqlParameter();
                UUserType.ParameterName = "@UserType ";
                UUserType.SqlDbType = SqlDbType.VarChar;
                UUserType.Value = Convert.ToString(U.UserType);
                cmd.Parameters.Add(UUserType);

                SqlParameter uEmpNo = new SqlParameter();
                uEmpNo.ParameterName = "@EmpNo";
                uEmpNo.SqlDbType = SqlDbType.Int;
                uEmpNo.Value = Convert.ToString(U.EmpNo);
                cmd.Parameters.Add(uEmpNo);

                SqlParameter UEmail = new SqlParameter();
                UEmail.ParameterName = "@Email";
                UEmail.SqlDbType = SqlDbType.VarChar;
                UEmail.Value = U.Email;
                cmd.Parameters.Add(UEmail);

                SqlParameter UAdressId = new SqlParameter();
                UAdressId.ParameterName = "@AdressId";
                UAdressId.SqlDbType = SqlDbType.Int;
                UAdressId.Value = Convert.ToString(U.AdressId);
                cmd.Parameters.Add(UAdressId);

                SqlParameter UMobileNo = new SqlParameter();
                UMobileNo.ParameterName = "@MobileNo";
                UMobileNo.SqlDbType = SqlDbType.VarChar;
                UMobileNo.Value = Convert.ToString(U.MobileNo);
                cmd.Parameters.Add(UMobileNo);

                SqlParameter URole1 = new SqlParameter();
                URole1.ParameterName = "@Role";
                URole1.SqlDbType = SqlDbType.VarChar;
                URole1.Value = U.Role;
                cmd.Parameters.Add(URole1);

                SqlParameter UActive = new SqlParameter();
                UActive.ParameterName = "@Active";
                UActive.SqlDbType = SqlDbType.Int;
                UActive.Value = Convert.ToBoolean(U.Active) ? "1" : "0";
                cmd.Parameters.Add(UActive);

                SqlParameter UUserName = new SqlParameter();
                UUserName.ParameterName = "@UserName";
                UUserName.SqlDbType = SqlDbType.VarChar;
                UUserName.Value = U.UserName;
                cmd.Parameters.Add(UUserName);


                SqlParameter UPassword = new SqlParameter();
                UPassword.ParameterName = "@Password";
                UPassword.SqlDbType = SqlDbType.VarChar;
                UPassword.Value = U.Password;
                cmd.Parameters.Add(UPassword);

                cmd.ExecuteScalar();

                conn.Close();

                //DataSet ds = new DataSet();
                //SqlDataAdapter db = new SqlDataAdapter(cmd);
                // db.Fill(ds);
                // Tbl = ds.Tables[0];
            }
            catch (Exception ex)
            {
                string str = ex.Message;
            }
            // int found = 0;
            return Tbl;
        }

        public void Options()
        {

        }
    }
}