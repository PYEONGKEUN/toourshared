﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using MySql.Data.MySqlClient;
using System.Data;
using tooushared.Lib;
using tooushared.DTO;


/// <summary>
/// CommentDao의 요약 설명입니다.
/// </summary>
public class CommentDao
{
    public CommentDao()
    {
        //
        // TODO: 여기에 생성자 논리를 추가합니다.
        //
    }


    public string InsertComment(Comment comment)
    {

            MyDB myDB = new MyDB();
            MySqlConnection con = null;
            string result = "";
        try
        {

            con = myDB.GetCon();
            string Sql = "INSERT INTO toourshared.comment (trv_no, cmt_content, mem_id, cmt_rate, cmt_timestamp) VALUES(@trv_no, @cmt_content, @mem_id, @cmt_rate, @cmt_timestamp); select last_insert_id()";
            MySqlCommand cmd = new MySqlCommand(Sql, con);

            cmd.Parameters.AddWithValue("@trv_no", comment.Trv_no);
            cmd.Parameters.AddWithValue("@cmt_content", comment.Cmt_content);
            cmd.Parameters.AddWithValue("@mem_id", comment.Mem_id.ToString());
            cmd.Parameters.AddWithValue("@cmt_rate", comment.Cmt_rate);
            cmd.Parameters.AddWithValue("@cmt_timestamp", comment.Cmt_timestamp);

            con.Open();

            cmd.ExecuteNonQuery();

            result = cmd.LastInsertedId.ToString();

            

        }
        catch(Exception ex)
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
    //public void DeleteCommentBy(mem_id)


    public int UpdateComment(Comment comment)
    {
        int result =0;

        MyDB myDB = new MyDB();
        MySqlConnection con = null;
        try {
            con = myDB.GetCon();
            string Sql = "UPDATE toourshared.comment SET cmt_content=@cmt_content, cmt_rate=@cmt_rate, cmt_timestamp=@cmt_timestamp, mem_id=@mem_id where cmt_no=@cmt_no";
        MySqlCommand cmd = new MySqlCommand(Sql, con);

        cmd.Parameters.AddWithValue("@cmt_content", comment.Cmt_content);
        cmd.Parameters.AddWithValue("@cmt_rate", comment.Cmt_rate);
        cmd.Parameters.AddWithValue("@cmt_timestamp", comment.Cmt_timestamp);
        cmd.Parameters.AddWithValue("@mem_id", comment.Mem_id);
        cmd.Parameters.AddWithValue("@cmt_no", comment.Cmt_no);

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

    public int DeleteComment(Comment comment)
    {
        int result = 0;

        MyDB myDB = new MyDB();
        MySqlConnection con =null;
        try
        {
            con = myDB.GetCon();

            string Sql = "DELETE FROM toourshared.comment WHERE cmt_no=@cmt_no";
        MySqlCommand cmd = new MySqlCommand(Sql, con);

        cmd.Parameters.AddWithValue("@cmt_no", comment.Cmt_no);

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


    public DataSet SelectComment()
    {
        MyDB myDB = new MyDB();
        MySqlConnection con = null;
        DataSet ds = null;
        try
        {

            con = myDB.GetCon();
            string sql = "Select cmt_no, cmt_content, cmt_rate, cmt_timestamp, mem_id  From toourshared.comment";
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

    public Comment selectCommentByCmt_no(Comment comment)
    {

        MyDB mydb = new MyDB();

        Comment result = new Comment();
        MySqlConnection con = null;
        MySqlDataReader rd = null;
        try
        {
            con = mydb.GetCon();

            string Sql = "SELECT * FROM toourshared.comment where cmt_no=@cmt_no";


            MySqlCommand cmd = new MySqlCommand(Sql, con);

            cmd.Parameters.AddWithValue("@cmt_no", comment.Cmt_no);

            con.Open();
             rd = cmd.ExecuteReader();

            if (rd.HasRows)
            {
                

                result.Cmt_no = rd["cmt_no"].ToString();
                result.Trv_no = rd["trv_no"].ToString();
                result.Cmt_content = rd["cmt_content"].ToString();
                result.Cmt_rate = rd["cmt_rate"].ToString();
                result.Cmt_timestamp = rd["cmt_timestamp"].ToString();
                result.Mem_id = rd["mem_id"].ToString();


                //lstMember.Add(tmpMemberPointer);

                return result;

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

    public int selectCommentCountByTrvNo(Travel travel)
    {
        MyDB mydb = new MyDB();
        int returnInt = 0;
        MySqlConnection con = null;
        MySqlDataReader reader = null;

        try
        {
            con = mydb.GetCon();
            string Sql = "SELECT count(*) as cnt FROM toourshared.comment where trv_no = @trv_no";

            MySqlCommand cmd = new MySqlCommand(Sql, con);
            cmd.Parameters.AddWithValue("@trv_no", travel.Trv_no);

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

    public List<Comment> selectCommentListByTrvNo(Travel travel)
    {
        MyDB mydb = new MyDB();
        List<Comment> returnList = new List<Comment>();
        Comment result;
        MySqlConnection con = null;
        MySqlDataReader reader = null;
        try
        {
            con = mydb.GetCon();
            string Sql = "SELECT * FROM toourshared.comment where trv_no = @trv_no order by cmt_timestamp desc";

            MySqlCommand cmd = new MySqlCommand(Sql, con);
            cmd.Parameters.AddWithValue("@trv_no", travel.Trv_no);

            con.Open();
           reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                result = new Comment();
                result.Cmt_content = reader["cmt_content"].ToString();
                result.Cmt_no = reader["cmt_no"].ToString();
                result.Cmt_rate = reader["cmt_rate"].ToString();
                result.Cmt_timestamp = reader["cmt_timestamp"].ToString();
                result.Mem_id = reader["mem_id"].ToString();
                result.Trv_no = reader["trv_no"].ToString();
                returnList.Add(result);
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

        return returnList;
    }

    public List<Comment> selectCommentListByMem_id(Comment comment, int limit1 = -1, int limit2 = -1)
    {
        MyDB mydb = new MyDB();

        List<Comment> resultList = new List<Comment>();
        Comment result;
        MySqlConnection con = null;
        MySqlDataReader rd= null;
        string Sql = "";

        try
        {
                       
            con = mydb.GetCon();

            if (limit1 != -1 && limit2 != -1)
                Sql = "SELECT * FROM toourshared.comment WHERE mem_id = @mem_id ORDER BY cmt_timestamp DESC LIMIT " + limit1 + ", " + limit2;
            else
                Sql = "SELECT * FROM toourshared.comment WHERE mem_id = @mem_id";


            MySqlCommand cmd = new MySqlCommand(Sql, con);
            cmd.Parameters.AddWithValue("@mem_id", comment.Mem_id);

            con.Open();
           rd = cmd.ExecuteReader();

            while (rd.Read())
            {

                result = new Comment();
                result.Cmt_no = rd["cmt_no"].ToString();
                result.Trv_no = rd["trv_no"].ToString();
                result.Mem_id = rd["mem_id"].ToString();
                result.Cmt_rate = rd["cmt_rate"].ToString();
                result.Cmt_timestamp = rd["cmt_timestamp"].ToString();
                result.Cmt_content = rd["cmt_content"].ToString();
                resultList.Add(result);
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
