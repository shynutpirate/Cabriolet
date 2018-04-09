<%@ page import = "java.io.*,java.util.*,javax.mail.*"%>

<%@ page import = "javax.mail.internet.*,javax.activation.*"%>

<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>



<%

   String result;

   

   // Recipient's email ID needs to be mentioned.
   String mailId = (String) session.getAttribute("emailId");

   String to = mailId;



   // Sender's email ID needs to be mentioned

   String from = "lekya.sheral05@gmail.com";



   // Assuming you are sending email from localhost

String host = "smtp.gmail.com";

  // Get system properties object

   Properties properties = System.getProperties();

   properties.put("mail.smtp.starttls.enable", "true");

properties.put("mail.smtp.host", host);

properties.put("mail.smtp.user", from);

properties.put("mail.smtp.password", "Sryandee05");

properties.put("mail.smtp.port", "587");

properties.put("mail.smtp.auth", "true");

properties.put("mail.smtp.ssl.trust", "smtp.gmail.com");



   // Setup mail server

   properties.setProperty("mail.smtp.host", host);



   // Get the default Session object.

   Session mailSession = Session.getDefaultInstance(properties);

   MimeMessage message = new MimeMessage(mailSession);



   try {

      // Create a default MimeMessage object.

      

      // Set From: header field of the header.

      message.setFrom(new InternetAddress(from));

      

      // Set To: header field of the header.

      message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

      

      // Set Subject: header field

      message.setSubject("This is the Subject Line!");

     String source = (String) session.getAttribute("source");
     String destination = (String) session.getAttribute("destination");
     String amount = (String) session.getAttribute("amount");

      // Send the actual HTML message, as big as you like

      message.setContent("<h1>BILL AMOUNT :" +amount+ "</h1> <body>Source :" +source+ " <br> Destination :" +destination+ " </body>", "bill/jsp" );

     // message.setContent("<h1>hello</h1>","bill/jsp");

      Transport transport = mailSession.getTransport("smtp");

transport.connect(host, from, "ryandee05");

transport.sendMessage(message, message.getAllRecipients());

transport.close();

      // Send message

     // Transport.send(message);

      result = "Sent message successfully....";

   } catch (MessagingException mex) {

      mex.printStackTrace();

      result = "Error: unable to send message....";

   }

%>



<html>

   <head>

      <title>Send HTML Email using JSP</title>

   </head>



   <body>

      

         <h1>Send Email using JSP</h1>

      

      

      <p align = "center">

         <% 

            out.println("Result: " + result + "\n");

         %>

      </p>

   </body>

</html>