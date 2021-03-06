﻿using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Member_BlockDao의 요약 설명입니다.
/// </summary>
public class Member_BlockDao
{
    public Member_BlockDao()
    {
        //
        // TODO: 여기에 생성자 논리를 추가합니다.
        //
    }

    public string InsertMember_Block(Member_Block member_Block)
    {
        string result = "";
        MyDB myDB = new MyDB();
        MySqlConnection con = myDB.GetCon();

        string Sql = "INSERT INTO toourshared.member_block (mem_blo_date,mem_ble_length,mem_id) VALUES(@mem_blo_date,@mem_blo_length,@mem_id); select last_insert_id()";
        MySqlCommand cmd = new MySqlCommand(Sql, con);

        cmd.Parameters.AddWithValue("@mem_blo_date", member_Block.Mem_blo_date);
        cmd.Parameters.AddWithValue("@mem_blo_length", member_Block.Mem_blo_length);
        cmd.Parameters.AddWithValue("@mem_id", member_Block.Mem_id);


        con.Open();

        cmd.ExecuteNonQuery();

        result = cmd.LastInsertedId.ToString();

        con.Close();


        return result;
    }

    public DataSet SelectMember_Block()
    {
        MyDB myDB = new MyDB();
        MySqlConnection con = myDB.GetCon();

        //계정활동이 정지상태인 회원 조회
        //string sql = "Select mem_blo_no, mem_id, mem_blo_date, mem_blo_length From toourshared.member_block";
        string sql = "Select distinct member_block.mem_blo_no, member_block.mem_id, member_block.mem_blo_date, member_block.mem_blo_length " +
            "From member_block, member where member.mem_state = 1 order by member_block.mem_blo_no";
        MySqlCommand cmd = new MySqlCommand(sql, con); // 커맨드(sql문을 con에서 수행하기 위한 명령문) 생성 DB에서 수행시킬 명령 생성   

        MySqlDataAdapter ad = new MySqlDataAdapter();
        ad.SelectCommand = cmd;
        DataSet ds = new DataSet();
        ad.Fill(ds);

        return ds;
    }

    public Member_Block selectMember_BlockBymem_blo_no(Member_Block member_Block)
    {

        MyDB mydb = new MyDB();

        Member_Block result = new Member_Block();
        MySqlConnection con;

        try
        {
            con = mydb.GetCon();

            string Sql = "SELECT * FROM toourshared.member_block where member_block=@mem_blo_no";


            MySqlCommand cmd = new MySqlCommand(Sql, con);

            cmd.Parameters.AddWithValue("@mem_blo_no", member_Block.Mem_blo_no);

            con.Open();

            MySqlDataReader rd = cmd.ExecuteReader();

            if (rd.HasRows)
            {
                rd.Read();

                result.Mem_blo_no = rd["mem_blo_no"].ToString();
                result.Mem_blo_date = rd["mem_blo_date"].ToString();
                result.Mem_blo_length = rd["mem_blo_length"].ToString();
                result.Mem_id = rd["mem_content"].ToString();

                //lstMember.Add(tmpMemberPointer);

                return result;
            }

            con.Close();

        }

        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine(ex.ToString());
        }
        return result;
    }

    public int updateMemberBlock(string mem_id)
    {
        MyDB mydb = new MyDB();

        MySqlConnection con;

        int result = 0;

        try
        {
            con = mydb.GetCon();

            string sql = "update toourshared.member set mem_state = 0 where mem_id = @mem_id";
            MySqlCommand cmd = new MySqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@mem_id", mem_id);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            result = 1;

            return result;
        }
        catch(Exception e)
        {
            result = 0;
        }

        return result;
    }

    public int deleteMemberBlock(string mem_id)
    {
        MyDB mydb = new MyDB();

        MySqlConnection con;

        int result = 0;

        try
        {
            con = mydb.GetCon();

            string sql = "delete from toourshared.member_block where mem_id = @mem_id";
            MySqlCommand cmd = new MySqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@mem_id", mem_id);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            result = 1;

            return result;
        }
        catch (Exception e)
        {
            result = 0;
        }

        return result;
    }
}