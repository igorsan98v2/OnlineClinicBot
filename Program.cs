using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Net;
using SimpleJSON;
using System.Collections.Specialized;

namespace tgBot
{
 class Program
    {
        public static string Token = @"518487354:AAEw0SgPxfoBjFSJ8HYGHVG99c3Sylu2cK8";
        public static int LastUpdateID = 0;
        
        static void Main(string[] args)
        {
            while (true)
            {
                GetUpdates();
                Thread.Sleep(1000);
            }
           
        }
        static void GetUpdates()
        {
            using (var webClient = new WebClient())
            {
                Console.WriteLine("Запрос обновления {0}",LastUpdateID+1);
                    string response = webClient.DownloadString("https://api.telegram.org/bot" + Token + "/getUpdates" + "?offset=" + (LastUpdateID + 1));
 
                var N = JSON.Parse(response);
 
                foreach (JSONNode r in N["result"].AsArray)
                {
                    LastUpdateID = r["update_id"].AsInt;
 
                    Console.WriteLine("Пришло сообщение: {0}", r["message"]["text"]);
                    if(LastUpdateID==0)SendMessage("Здраствуйте ,я бот из регистратуры чем могу быть полезен,опишите ваши симптомы пожалуйста или скажите к какому врачу вы хотите попасть", r["message"]["chat"]["id"].AsInt);
                
                    if(LastUpdateID%2==0){
                        SendMessage("Как интересно , я попытаюсь подобрать вам врача", r["message"]["chat"]["id"].AsInt);
                    
                    }
                    else{
                          SendMessage("Такое не лечится , я выберу вам венок по красивее", r["message"]["chat"]["id"].AsInt);
                    
                    }
                }

            }
        }
        static void SendMessage(string message, int chatid)
        {
            using (var webClient = new WebClient())
            {
                var pars = new NameValueCollection();
 
                pars.Add("text", message);
                pars.Add("chat_id", chatid.ToString());
 
 
                webClient.UploadValues("https://api.telegram.org/bot" + Token + "/sendMessage", pars);
 
            }
        }
        
    }
}