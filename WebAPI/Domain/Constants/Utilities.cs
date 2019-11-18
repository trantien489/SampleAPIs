﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Domain.Constants
{
    public static class Utilities
    {
        public static string MakeExceptionMessage(Exception ex)
        {
            return ex.InnerException == null ? ex.Message : ex.InnerException.Message;
        }

        public static string RandomString(int length)
        {
            var random = new Random();
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            return new string(Enumerable.Repeat(chars, length)
                .Select(s => s[random.Next(s.Length)]).ToArray());
        }

    }
}
