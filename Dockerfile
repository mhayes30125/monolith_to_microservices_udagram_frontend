# Use NodeJS base image
FROM node:13 as udagram-frontend-compiled

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies by copying
# package.json and package-lock.json
COPY package*.json ./

COPY package*.json ./

# Install dependencies
RUN npm install -g ionic
RUN npm install

# Copy app source
COPY . .

RUN ionic build

# Bind the port that the image will run on
#EXPOSE 8100

FROM nginx

#COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf 
COPY --from=udagram-frontend-compiled /usr/src/app/www /usr/share/nginx/html

# Define the Docker image's behavior at runtime
#ENTRYPOINT ["ionic"]
#CMD ["serve", "8100", "--address", "0.0.0.0"]
