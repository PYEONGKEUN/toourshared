﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;

/// <summary>
/// TimeLib 요약 설명입니다.
/// DB의 일시, 일 부분에 사용할 시간 라이브러리
/// </summary>
namespace tooushared.Lib
{
    public class TimeLib
    {
  

        public TimeLib()
        {

        }
              

        public static string GetTimeStamp()
        {
            string now = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            return now;
        }
        public static string GetToday()
        {
            string now = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            return now;
        }
        public static string CreateDate(int year,int month, int date)
        {
            string result = $"{year:d4}-{month:d2}-{date:d2}";
            return result;
        }
    }
}