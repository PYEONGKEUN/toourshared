﻿using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using tooushared.Lib;

/// <summary>
/// FollowerDao의 요약 설명입니다.
/// </summary>
public class FollowerDao
{
    public FollowerDao()
    {
        //
        // TODO: 여기에 생성자 논리를 추가합니다.
        //
    }
    public string InsertFollower(Follower follower)
    {


        MyDB myDB = new MyDB();
        MySqlConnection con = myDB.GetCon();
        string result = "";
        try
        {

            string Sql = "INSERT INTO toourshared.follower (mem_id,fol_id) VALUES(@mem_id,@fol_id); select last_insert_id()";
            MySqlCommand cmd = new MySqlCommand(Sql, con);

            cmd.Parameters.AddWithValue("@mem_id", follower.Mem_id);
            cmd.Parameters.AddWithValue("@fol_id", follower.Fol_id);



            con.Open();

            cmd.ExecuteNonQuery();

            result = cmd.LastInsertedId.ToString();


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

    public void DeleteFollower(Follower follower)
    {
        MyDB mydb = new MyDB();
        MySqlConnection con;

        try
        {
            con = mydb.GetCon();
            string Sql = "DELETE FROM toourshared.follower WHERE mem_id = @mem_id AND fol_id = @fol_id";

            MySqlCommand cmd = new MySqlCommand(Sql, con);
            cmd.Parameters.AddWithValue("@mem_id", follower.Mem_id);
            cmd.Parameters.AddWithValue("@fol_id", follower.Fol_id);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
        catch(Exception e) {;}

        return;
    }

    //public void DeleteCommentBy(mem_id)
    public DataSet SelectFollwer()
    {
        MyDB myDB = new MyDB();
        MySqlConnection con = myDB.GetCon();
        DataSet ds = null;
        try
        {

            string sql = "Select fol_no, mem_id, fol_id  From toourshared.follwer";
            MySqlCommand cmd = new MySqlCommand(sql, con); // 커맨드(sql문을 con에서 수행하기 위한 명령문) 생성 DB에서 수행시킬 명령 생성   

            MySqlDataAdapter ad = new MySqlDataAdapter();
            ad.SelectCommand = cmd;

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

    public Follower selectFollwerByfol_no(Follower follower)
    {

        MyDB mydb = new MyDB();

        Follower result = new Follower();
        MySqlConnection con = null;

        MySqlDataReader rd = null;

        try
        {
            con = mydb.GetCon();

            string Sql = "SELECT * FROM toourshared.follwer where fol_no =@fol_no";


            MySqlCommand cmd = new MySqlCommand(Sql, con);

            cmd.Parameters.AddWithValue("@fol_no", follower.fol_no);

            con.Open();
            rd = cmd.ExecuteReader();



            if (rd.HasRows)
            {
                rd.Read();

                result.fol_no = rd["fol_no"].ToString();
                result.Mem_id = rd["mem_id"].ToString();
                result.Fol_id = rd["fol_id"].ToString();



                //lstMember.Add(tmpMemberPointer);



            }


        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine(ex.ToString());
            rd.Close();

        }
        finally
        {
            rd.Close();
            con.Close();
        }

        return result;
    }

    public List<Follower> selectFollowListByMemID(Follower follower, int defaultNum = -1)
    {
        MyDB mydb = new MyDB();
        List<Follower> returnList = new List<Follower>();

        Follower fol;
        MySqlConnection con;
        string Sql = "";

        try
        {
            con = mydb.GetCon();

            if (defaultNum == -1)
                Sql = "SELECT * FROM toourshared.follower where fol_id = @mem_id";
            else
                Sql = "SELECT * FROM toourshared.follower WHERE fol_id = @mem_id ORDER BY fol_no DESC LIMIT 0, 15";

            MySqlCommand cmd = new MySqlCommand(Sql, con);
            cmd.Parameters.AddWithValue("@mem_id", follower.Mem_id);

            con.Open();
            MySqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                fol = new Follower();
                fol.Mem_id = reader["mem_id"].ToString();
                fol.Fol_id = reader["fol_id"].ToString();

                returnList.Add(fol);
            }

            reader.Close();
            con.Close();
        }
        catch (Exception e) {; }

        return returnList;
    }

    public List<Follower> selectFollwerListByMem_id(Follower follower)
    {
        MyDB mydb = new MyDB();

        List<Follower> resultList = new List<Follower>();
        Follower result;

        MySqlConnection con = null;

        MySqlDataReader rd = null;
        try
        {



            con = mydb.GetCon();

            string Sql = "SELECT * FROM toourshared.follower where mem_id=@mem_id";


            MySqlCommand cmd = new MySqlCommand(Sql, con);

            cmd.Parameters.AddWithValue("@mem_id", follower.Mem_id);

            con.Open();
            rd = cmd.ExecuteReader();

            while (rd.Read())
            {

                result = new Follower();
                result.Fol_id = rd["fol_id"].ToString();
                result.Mem_id = rd["mem_id"].ToString();

                //lstMember.Add(tmpMemberPointer);

                resultList.Add(result);

            }
            rd.Close();
            con.Close();


        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine(ex.ToString());
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

    // 파라미터로 받은 사용자(ID)의 팔로워 수를 반환하는 함수
    public int getFollowerCountByMemId(string ID)
    {
        MyDB myDB = new MyDB();
        int returnInt = 0;
        MySqlConnection con = null;
        MySqlDataReader reader = null;

        try
        {
            con = myDB.GetCon();
            string Sql = "SELECT count(fol_id) as cnt FROM toourshared.follower WHERE mem_id = '" + ID + "'";

            MySqlCommand cmd = new MySqlCommand(Sql, con);
            con.Open();

            reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                returnInt = int.Parse(reader["cnt"].ToString());
            }
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine(ex.StackTrace.ToString());
            reader.Close();
            con.Close();

        }
        finally
        {
            reader.Close();
            con.Close();
        }
        return returnInt;
    }

    // 파라미터로 받은 사용자(ID)의 팔로우 수를 반환하는 함수
    public int getFollowCountByMemId(string ID)
    {
        MyDB myDB = new MyDB();

        int returnInt = 0;
        MySqlConnection con = null;
        MySqlDataReader reader = null;

        try
        {
            con = myDB.GetCon();
            string Sql = "SELECT count(mem_id) as cnt FROM toourshared.follower WHERE fol_id = '" + ID + "'";

            MySqlCommand cmd = new MySqlCommand(Sql, con);
            con.Open();

            reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                returnInt = int.Parse(reader["cnt"].ToString());
            }


        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine(ex.StackTrace.ToString());
            reader.Close();
            con.Close();

        }
        finally
        {
            reader.Close();
            con.Close();
        }

        return returnInt;
    }

    public bool isExistFollowerWhereMemIdANDFolId(Follower follower)
    {
        MyDB myDB = new MyDB();
        MySqlConnection con;
        int getCnt = 0;

        try
        {
            con = myDB.GetCon();
            string Sql = "SELECT count(*) as cnt FROM toourshared.follower WHERE mem_id = @mem_id AND fol_id = @fol_id";

            MySqlCommand cmd = new MySqlCommand(Sql, con);
            cmd.Parameters.AddWithValue("@mem_id", follower.Mem_id);
            cmd.Parameters.AddWithValue("@fol_id", follower.Fol_id);

            con.Open();
            MySqlDataReader reader = cmd.ExecuteReader();

            if(reader.Read())
            {
                getCnt = int.Parse(reader["cnt"].ToString());
            }

            reader.Close();
            con.Close();
        }
        catch(Exception e) {;}

        if (getCnt <= 0) // 데이터가 존재하지 않는 경우니까 팔로우하지 않은거고
            return false;
        else // 데이터가 존재하니까 팔로워한 거임. (fol_id 가 mem_id를 팔로우 한거고 mem_id는 fol_id로의 팔로워임)
            return true;
    }
}