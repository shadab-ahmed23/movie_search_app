# Create app directory
FROM node:latest
WORKDIR /app

# Copy both package.json and package-lock.json
COPY package*.json ./

# Install app dependencies
# RUN npm install
# For production use
RUN npm fund
RUN npm install


# Bundle app source
COPY . .

EXPOSE 3000
CMD [ "npm", "start"]
