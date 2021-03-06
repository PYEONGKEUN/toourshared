﻿using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using tooushared.Lib;

/// <summary>
/// MapDao의 요약 설명입니다.
/// </summary>
public class MapDao
{
    public MapDao()
    {
       
    }


    public string InsertMap(Map map)
    {

        MyDB myDB = new MyDB();
        MySqlConnection con = myDB.GetCon();
        string result = "";

        try
        {
            string Sql = "INSERT INTO toourshared.map ( trv_day_no, map_data, map_route, map_cost, map_center) VALUES (@trv_day_no, @map_data, @map_route, @map_cost,@map_center)";
            MySqlCommand cmd = new MySqlCommand(Sql, con);

            cmd.Parameters.AddWithValue("@map_cost", map.Map_cost);
            cmd.Parameters.AddWithValue("@map_data", map.Map_data);
            cmd.Parameters.AddWithValue("@map_route", map.Map_route);
            cmd.Parameters.AddWithValue("@trv_day_no", map.Trv_day_no);
            cmd.Parameters.AddWithValue("@map_center", map.Map_center);


            con.Open();

            cmd.ExecuteNonQuery();


        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine(ex.StackTrace.ToString());
            con.Close();

        }
        finally
        {
            con.Close();
        }


        return result;
    }

    public int UpdateMap(Map map)
    {
        int result = 0;

        MyDB myDB = new MyDB();
        MySqlConnection con = myDB.GetCon();

        try
        {


            string Sql = "UPDATE toourshared.map SET trv_day_no = @trv_day_no, map_data = @map_data, map_route = @map_route, map_cost = @map_cost, map_center=@map_center WHERE map_no = @map_no";


            MySqlCommand cmd = new MySqlCommand(Sql, con);

            cmd.Parameters.AddWithValue("@map_no", map.Map_no);
            cmd.Parameters.AddWithValue("@map_cost", map.Map_cost);
            cmd.Parameters.AddWithValue("@map_data", map.Map_data);
            cmd.Parameters.AddWithValue("@map_route", map.Map_route);
            cmd.Parameters.AddWithValue("@map_center", map.Map_center);
            cmd.Parameters.AddWithValue("@trv_day_no", map.Trv_day_no);

            con.Open();

            result = cmd.ExecuteNonQuery();


        
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine(ex.StackTrace.ToString());
            con.Close();

        }
        finally
        {
            con.Close();
        }


        return result;
    }

    public int UpdateMapByTrvDayNo(Map map)
    {
        int result = 0;

        MyDB myDB = new MyDB();
        MySqlConnection con = myDB.GetCon();

        try
        {
            string Sql = "UPDATE toourshared.map SET map_data = @map_data, map_route = @map_route, map_cost = @map_cost, map_center = @map_center WHERE trv_day_no = @trv_day_no";


            MySqlCommand cmd = new MySqlCommand(Sql, con);

            cmd.Parameters.AddWithValue("@map_cost", map.Map_cost);
            cmd.Parameters.AddWithValue("@map_data", map.Map_data);
            cmd.Parameters.AddWithValue("@map_route", map.Map_route);
            cmd.Parameters.AddWithValue("@map_center", map.Map_center);
            cmd.Parameters.AddWithValue("@trv_day_no", map.Trv_day_no);

            con.Open();

            result = cmd.ExecuteNonQuery();


     
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine(ex.StackTrace.ToString());
            con.Close();

        }
        finally
        {
            con.Close();
        }

        return result;
    }



    public DataSet SelectMap()
    {
        MyDB myDB = new MyDB();
        MySqlConnection con = null;
        DataSet ds = null;
        try {
            con = myDB.GetCon();

        string sql = "SELECT map_no,trv_day_no, map_data, map_route, map_cost, map_center FROM toourshared.map";
        MySqlCommand cmd = new MySqlCommand(sql, con); // 커맨드(sql문을 con에서 수행하기 위한 명령문) 생성 DB에서 수행시킬 명령 생성   
            con.Open();
        MySqlDataAdapter ad = new MySqlDataAdapter();
        ad.SelectCommand = cmd;
        ds = new DataSet();
        ad.Fill(ds);
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine(ex.StackTrace.ToString());
            con.Close();
        }
        finally
        {
            con.Close();
        }

        return ds;
    }


    public Map selectMapByMap_no(Map map)
    {

        MyDB mydb = new MyDB();
        MySqlConnection con = null;
        MySqlDataReader rd = null;
        Map result = new Map();
       

        try
        {
            con = mydb.GetCon();

            string Sql = "SELECT * FROM toourshared.map where map_no=@map_no";


            MySqlCommand cmd = new MySqlCommand(Sql, con);

            cmd.Parameters.AddWithValue("@map_no", map.Map_no);

            con.Open();
            rd = cmd.ExecuteReader();

            if (rd.HasRows)
            {


                result.Map_no = rd["map_no"].ToString();
                result.Map_cost = rd["map_cost"].ToString();
                result.Map_data = rd["map_data"].ToString();
                result.Map_route = rd["map_route"].ToString();
                result.Map_center = rd["map_center"].ToString();
                result.Trv_day_no = rd["trv_day_no"].ToString();
               

                //lstMember.Add(tmpMemberPointer);



            }
   

        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine(ex.StackTrace.ToString());
            rd.Close();
            con.Close();

        }

        finally
        {
            rd.Close();
            con.Close();
        }
        return result;
    }
    public Map selectMapByTrv_day_no(Map map)
    {

        MyDB mydb = new MyDB();
        MySqlConnection con = null;
        MySqlDataReader rd = null;
        Map result = new Map();
        

        try
        {
            con = mydb.GetCon();

            string Sql = "SELECT * FROM toourshared.map where trv_day_no=@trv_day_no";


            MySqlCommand cmd = new MySqlCommand(Sql, con);

            cmd.Parameters.AddWithValue("@trv_day_no", map.Trv_day_no);

            con.Open();
            rd = cmd.ExecuteReader();

            if (rd.Read())
            {


                result.Map_no = rd["map_no"].ToString();
                result.Map_cost = rd["map_cost"].ToString();
                result.Map_data = rd["map_data"].ToString();
                result.Map_route = rd["map_route"].ToString();
                result.Map_center = rd["map_center"].ToString();
                result.Trv_day_no = rd["trv_day_no"].ToString();


                //lstMember.Add(tmpMemberPointer);


            }


        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine(ex.StackTrace.ToString());
            rd.Close();
            con.Close();

        }

        finally
        {
            rd.Close();
            con.Close();
        }

        return result;
    }


    public List<Map> mapRouteCost(int travelNo)
    {

        MyDB mydb = new MyDB();
        Map result = new Map();
        MySqlConnection con = null;
        MySqlDataReader rd = null;

        List<Map> resultList = new List<Map>();
       

        try
        {
            con = mydb.GetCon();

            string Sql = "select map_route, map_cost from toourshared.map where trv_day_no in (select trv_day_no from toourshared.travel_day where trv_no = @trv_no)";

            MySqlCommand cmd = new MySqlCommand(Sql, con);

            cmd.Parameters.AddWithValue("@trv_no", travelNo);

            con.Open();
            rd = cmd.ExecuteReader();

            if (rd.Read())
            {


                result.Map_no = rd["map_no"].ToString();
                result.Map_cost = rd["map_cost"].ToString();
                result.Map_data = rd["map_data"].ToString();
                result.Map_route = rd["map_route"].ToString();
                result.Map_center = rd["map_center"].ToString();
                result.Trv_day_no = rd["trv_day_no"].ToString();

                resultList.Add(result);
                //lstMember.Add(tmpMemberPointer);


            }


        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine(ex.StackTrace.ToString());
            rd.Close();
            con.Close();

        }

        finally
        {
            rd.Close();
            con.Close();
        }


        return resultList;
    }



}