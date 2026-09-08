FROM node:22-alpine AS base
WORKDIR /app

COPY package*.json turbo.json ./
COPY apps/backend/package.json apps/backend/package.json
RUN npm install

COPY . .
RUN NODE_OPTIONS="--max-old-space-size=1536" npm run build --workspace=apps/backend

WORKDIR /app/apps/backend/.medusa/server
RUN npm install --omit=dev

ENV NODE_ENV=production
EXPOSE 9000
CMD ["npm", "run", "start"]
