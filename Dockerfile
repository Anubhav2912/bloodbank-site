# Use the official Python image as the base image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install the Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire project into the container
COPY . .

# Collect the static files
RUN python manage.py collectstatic --no-input

# Install Gunicorn
RUN pip install gunicorn

# Expose the port that Gunicorn will run on
EXPOSE 8000

# Set the command to start Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "bloodbankmanagement.wsgi"]