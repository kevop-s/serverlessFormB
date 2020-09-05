const express = require('express');
const bodyParser = require('body-parser');
const nodemailer = require('nodemailer');
const cors = require('cors');

const app = express();

const port = process.env.BACK_PORT;
const portSmtp = process.env.SMTP_PORT;
const hostSmtp = process.env.SMTP_HOST;
const userSmtp = process.env.SMTP_USER;
const passSmtp = process.env.SMTP_PASS;
const serviceSmtp = process.env.SMTP_SERVICE;

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

app.use(cors({
  origin: '*'
}));

app.listen(port, () => {
  console.log('We are live on port %d',port);
});

app.post('/', (req,res) => {
  var data = req.body;

var smtpTransport = nodemailer.createTransport({
  service: serviceSmtp,
  port: portSmtp,
  auth: {
    user: userSmtp,
    pass: passSmtp
  }
});

var mailOptions = {
  from: userSmtp,
  to: data.email,
  subject: 'Test Email',
  html: `<p>${data.name}</p>
          <p>${data.email}</p>
          <p>${data.message}</p>`
};

smtpTransport.sendMail(mailOptions,
(error, response) => {
  if(error) {
    res.send(error)
  }else {
    res.send('Success')
  }
  smtpTransport.close();
});

})