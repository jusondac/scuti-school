# Scuti - Free Online School Platform

Scuti is an open-source, free online school platform designed to democratize education by providing high-quality learning experiences to students worldwide, regardless of their economic background.

## 🎯 Mission

Our mission is to break down barriers to education by creating a comprehensive, accessible, and engaging online learning environment where anyone can learn, grow, and achieve their educational goals without financial constraints.

## ✨ Features

### For Students
- **Free Access**: Complete courses and educational content at no cost
- **Interactive Learning**: Engaging multimedia content, quizzes, and assignments
- **Progress Tracking**: Monitor your learning journey and achievements
- **Community Support**: Connect with fellow learners and educators
- **Certificates**: Earn completion certificates for your accomplishments

### For Educators
- **Course Creation Tools**: Easy-to-use interface for creating rich educational content
- **Student Management**: Track student progress and engagement
- **Assessment Tools**: Create quizzes, assignments, and projects
- **Analytics Dashboard**: Gain insights into learning patterns and outcomes

### Platform Features
- **Responsive Design**: Works seamlessly on desktop, tablet, and mobile devices
- **Multi-language Support**: Accessible to learners worldwide
- **Accessibility First**: Designed with web accessibility standards in mind
- **Scalable Architecture**: Built to handle growing user base and content

## 🚀 Technology Stack

- **Backend**: Ruby on Rails 7.x
- **Frontend**: HTML5, CSS3, JavaScript with Stimulus
- **Styling**: Tailwind CSS
- **Database**: PostgreSQL (configurable)
- **Real-time Features**: Action Cable
- **Background Jobs**: Solid Queue
- **Deployment**: Docker & Kamal

## 📋 Prerequisites

- Ruby 3.2+ 
- Node.js 18+
- PostgreSQL 12+
- Redis (for caching and background jobs)

## 🛠️ Installation & Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/scuti.git
   cd scuti
   ```

2. **Install dependencies**
   ```bash
   bundle install
   npm install
   ```

3. **Setup database**
   ```bash
   rails db:create
   rails db:migrate
   rails db:seed
   ```

4. **Start the development server**
   ```bash
   bin/dev
   ```

5. **Visit the application**
   Open your browser and navigate to `http://localhost:3000`

## 🧪 Running Tests

```bash
# Run all tests
rails test

# Run system tests
rails test:system

# Run specific test file
rails test test/models/user_test.rb
```

## 🐳 Docker Development

```bash
# Build and run with Docker
docker-compose up --build

# Run commands inside container
docker-compose exec web rails console
```

## 🚀 Deployment

This project is configured for deployment with Kamal:

```bash
# Setup deployment
kamal setup

# Deploy
kamal deploy
```

## 🤝 Contributing

We welcome contributions from developers, educators, and learners! Please see our [Contributing Guide](CONTRIBUTING.md) for details on how to get started.

### Ways to Contribute
- 🐛 Report bugs and issues
- 💡 Suggest new features
- 📚 Improve documentation
- 🎨 Enhance UI/UX design
- 🧪 Write tests
- 🌍 Add translations

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Thanks to all educators who inspire lifelong learning
- Special appreciation to the open-source community
- Gratitude to all contributors making free education possible

## 📞 Contact & Support

- **GitHub Issues**: For bug reports and feature requests
- **Email**: support@scuti-education.org
- **Community Forum**: [Coming Soon]

---

**Together, let's make quality education accessible to everyone!** 🌟
