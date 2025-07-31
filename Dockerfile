# Use the official Flutter SDK image
FROM dart:stable AS build

# Install flutter
RUN git clone https://github.com/flutter/flutter.git /flutter
ENV PATH="/flutter/bin:/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Enable flutter web
RUN flutter config --enable-web
RUN flutter doctor

# Copy project files
WORKDIR /app
COPY . .

# Download dependencies
RUN flutter pub get

# Build the flutter web project
RUN flutter build web

# Use nginx to serve the web content
FROM nginx:alpine
COPY --from=build /app/build/web /usr/share/nginx/html

# Expose port
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
