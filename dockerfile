# Use a lightweight base image
FROM python:3.9-slim

# Set environment variables to prevent Python from writing .pyc files and buffer output
# by writing these two lines python wont create .pyc files and it wont put pressure on the system
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set the working directory inside the container
# making a directory within the image
WORKDIR /app

# Copy only the required files
COPY requirements.txt /app/
COPY app.py /app/
COPY templates /app/templates
COPY static /app/static

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port the app runs on
EXPOSE 5000

# Run the application
CMD ["python", "app.py"]