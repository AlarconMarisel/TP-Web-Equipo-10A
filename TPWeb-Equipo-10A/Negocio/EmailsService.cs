using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net;
using System.Net.Mail;

namespace Negocio
{
        public class EmailsService
        {
            private MailMessage email;
            private SmtpClient server;

            public EmailsService()
            {
                server = new SmtpClient();
                server.Host = "sandbox.smtp.mailtrap.io";
                server.Port = 2525;                      
                server.Credentials = new NetworkCredential("89d4cca4fd5a6d", "1affce39d73386");
                server.EnableSsl = true;
            }

            public void ArmarCorreo(string emailDestino, string asunto, string cuerpoHtml)
            {
                email = new MailMessage();
                email.From = new MailAddress("noresponder@promoweb.com", "Promo Web");
                email.To.Add(emailDestino);
                email.Subject = asunto;
                email.IsBodyHtml = true;
                email.Body = "<h1> confirmcacion de participacion en promo Ganar</h1> <br> Gracias por particar, te deseamos suerte en el sorteo</br>";
            }

            public void EnviarMail()
            {
                try
                {
                    server.Send(email);
                }
                catch (Exception ex)
                {
                    throw new Exception("Error al enviar el correo: " + ex.Message);
                }
            }
        }
    }
