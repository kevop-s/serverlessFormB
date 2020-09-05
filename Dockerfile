FROM node:12.18-stretch
COPY . .
WORKDIR /back
RUN npm install  
EXPOSE 4444

CMD npm start 
 

