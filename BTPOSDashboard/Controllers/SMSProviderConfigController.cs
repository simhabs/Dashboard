﻿
using BTPOSDashboard;
using BTPOSDashboardAPI.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Tracing;

namespace blocklist1.Controllers
{
    public class SMSProviderConfigController : ApiController
    {

          [HttpGet]

        public DataTable POSDashboard1()
        {
            DataTable Tbl = new DataTable();
            LogTraceWriter traceWriter = new LogTraceWriter();
            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetSMSProviderConfig credentials....");

            //connect to database
            SqlConnection conn = new SqlConnection();
            //connetionString="Data Source=ServerName;Initial Catalog=DatabaseName;User ID=UserName;Password=Password"
            conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "GetSMSProviderConfig";
            cmd.Connection = conn;
            DataSet ds = new DataSet();
            SqlDataAdapter db = new SqlDataAdapter(cmd);
            db.Fill(ds);
            Tbl = ds.Tables[0];
            traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "GetSMSProviderConfig Credentials completed.");
            // int found = 0;
            return Tbl;
        }
          [HttpPost]
          public HttpResponseMessage pos(SMSProviderConfig b)
          {

              LogTraceWriter traceWriter = new LogTraceWriter();
              traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "SaveSMSProviderConfig credentials....");
              //connect to database
              SqlConnection conn = new SqlConnection();
              try
              {

                  //connetionString="Data Source=ServerName;Initial Catalog=DatabaseName;User ID=UserName;Password=Password"
                  conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["btposdb"].ToString();

                  SqlCommand cmd = new SqlCommand();
                  cmd.CommandType = CommandType.StoredProcedure;
                  cmd.CommandText = "InsUpdDelELSMSProviderConfig";
                  cmd.Connection = conn;
                  conn.Open();
                  SqlParameter Aid = new SqlParameter();
                  Aid.ParameterName = "@Id";
                  Aid.SqlDbType = SqlDbType.VarChar;
                  Aid.Value = b.Id;
                  Aid.Value = Convert.ToString(b.Id);
                  cmd.Parameters.Add(Aid);

                  SqlParameter Gid = new SqlParameter();
                  Gid.ParameterName = "@ProviderName";
                  Gid.SqlDbType = SqlDbType.VarChar;
                  Gid.Value = b.ProviderName;
                  cmd.Parameters.Add(Gid);

                  SqlParameter lid = new SqlParameter();
                  lid.ParameterName = "@BTPOSGRPID";
                  lid.SqlDbType = SqlDbType.VarChar;
                  lid.Value = b.BTPOSGRPID;
                  cmd.Parameters.Add(lid);


                  SqlParameter pid = new SqlParameter();
                  pid.ParameterName = "@Active";
                  pid.SqlDbType = SqlDbType.VarChar;
                  pid.Value = b.Active;
                  cmd.Parameters.Add(pid);

                  SqlParameter ss = new SqlParameter();
                  ss.ParameterName = "@UserId";
                  ss.SqlDbType = SqlDbType.Int;
                  ss.Value = b.UserId;
                  ss.Value = Convert.ToString(b.UserId);
                  cmd.Parameters.Add(ss);


                  SqlParameter ii = new SqlParameter();
                  ii.ParameterName = "@Passkey";
                  ii.SqlDbType = SqlDbType.VarChar;
                  ii.Value = b.Passkey;
                  cmd.Parameters.Add(ii);

                  //DataSet ds = new DataSet();
                  //SqlDataAdapter db = new SqlDataAdapter(cmd);
                  //db.Fill(ds);
                  // Tbl = Tables[0];
                  cmd.ExecuteScalar();
                  conn.Close();

                  traceWriter.Trace(Request, "0", TraceLevel.Info, "{0}", "SaveSMSProviderConfig Credentials completed.");
                  return new HttpResponseMessage(HttpStatusCode.OK);
              }
              catch (Exception ex)
              {
                  if (conn != null && conn.State == ConnectionState.Open)
                  {
                      conn.Close();
                  }
                  string str = ex.Message;

                  traceWriter.Trace(Request, "1", TraceLevel.Info, "{0}", "Error in SaveSMSProviderConfig:" + ex.Message);
                  return Request.CreateErrorResponse(HttpStatusCode.NotFound, ex);
              }
          }
          public void Options() { }

    }
}
    


        
