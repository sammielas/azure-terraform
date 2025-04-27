#!/bin/bash

# Update system and install Apache
apt-get update -y
apt-get install -y apache2

# Create the webpage HTML file
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Our Creative Platform</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 0;
            color: #333;
        }
        .header {
            background-color: #f8f9fa;
            padding: 4rem 2rem;
            text-align: center;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 2rem;
        }
        .btn {
            display: inline-block;
            background-color: #007bff;
            color: white;
            padding: 0.5rem 1rem;
            text-decoration: none;
            border-radius: 4px;
            margin: 0.5rem;
        }
        .features {
            padding: 2rem 0;
            text-align: center;
        }
        .feature {
            margin-bottom: 2rem;
            padding-bottom: 2rem;
            border-bottom: 1px solid #eee;
        }
        .feature:last-child {
            border-bottom: none;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Welcome to Our Creative Platform</h1>
        <p>Transform your ideas into reality with our innovative solutions. We help businesses grow and succeed in the digital age.</p>
        <div>
            <a href="#" class="btn">Get Started →</a>
            <a href="#" class="btn">Learn More</a>
        </div>
    </div>

    <div class="container">
        <div class="features">
            <h2>Our Features</h2>
            <p>Everything you need to succeed in the digital world</p>
            
            <div class="feature">
                <h3>Cloud Solutions</h3>
                <p>Leverage the power of cloud computing with our scalable infrastructure solutions.</p>
            </div>
            
            <div class="feature">
                <h3>Global Reach</h3>
                <p>Expand your business globally with our international network and support.</p>
            </div>
            
            <div class="feature">
                <h3>Web Development</h3>
                <p>Create beautiful and responsive websites using modern technologies.</p>
            </div>
        </div>
    </div>
</body>
</html>
EOF

# Restart Apache to apply changes
systemctl restart apache2

# Enable Apache to start on boot
systemctl enable apache2