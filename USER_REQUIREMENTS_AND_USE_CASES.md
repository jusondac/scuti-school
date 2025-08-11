# Scuti - User Requirements and Use Cases

## Project Overview

**Scuti** is an open-source, free online school platform designed to democratize education by providing high-quality learning experiences to students worldwide, regardless of their economic background. The platform breaks down barriers to education by creating a comprehensive, accessible, and engaging online learning environment.

## Current Technology Stack

- **Backend**: Ruby on Rails 8.0.2
- **Frontend**: HTML5, CSS3, JavaScript with Stimulus, Tailwind CSS
- **Database**: PostgreSQL
- **Authentication**: Devise with Google OAuth integration
- **Real-time Features**: Action Cable (Solid Cable)
- **Background Jobs**: Solid Queue
- **Caching**: Solid Cache
- **Deployment**: Docker & Kamal
- **Asset Pipeline**: Propshaft

## Current System Status

### ✅ Implemented Features (Core Foundation)

#### User Management System
- **User Registration & Authentication**
  - Email/password registration via Devise
  - Google OAuth integration for social login
  - Role-based access control (Student, Teacher, Admin)
  - Two access levels (Normal, High)

#### Classroom Management System
- **Classroom Creation & Management** (Teachers/Admins only)
  - Create classrooms with name, subject, description
  - Set visibility (Public/Private)
  - Define student quotas
  - Set classroom status (Open/Closed)
  
- **Student Enrollment System**
  - Public classrooms: Automatic approval
  - Private classrooms: Request-based approval system
  - Quota management to prevent overcrowding
  - Enrollment status tracking (Pending, Approved, Rejected)

#### Authorization & Security
- Role-based access control
- Teacher verification for classroom creation
- Permission checks for classroom management
- Student approval workflow for private classes

### 🚧 Current Limitations & Missing Features

#### Content Management
- **No content creation tools** - classrooms exist but cannot contain learning materials
- **No lesson/module structure** - no way to organize educational content
- **No assignment system** - cannot create or submit assignments
- **No quiz/assessment tools** - no way to evaluate student progress

#### Communication & Collaboration
- **No messaging system** - no communication between teachers and students
- **No announcements** - no way to broadcast information to class members
- **No discussion forums** - no collaborative learning spaces
- **No real-time features** - despite Action Cable being available

#### Learning & Progress Tracking
- **No progress tracking** - cannot monitor student advancement
- **No grading system** - no way to evaluate student performance
- **No certificates** - mentioned in README but not implemented
- **No learning analytics** - no insights into learning patterns

#### User Experience
- **Basic UI** - functional but minimal user interface
- **No personalization** - no user profiles or preferences
- **No notifications** - no alerts for important events
- **No mobile optimization** - responsive design but not mobile-first

## User Requirements

### Primary User Roles

#### 1. Students (Primary End Users)
**Goals**: Access free, quality education and track learning progress

**Requirements**:
- Browse and join available courses/classrooms
- Access learning materials and content
- Submit assignments and take assessments
- Track personal learning progress
- Communicate with teachers and peers
- Receive certificates upon course completion
- Access courses on any device (responsive design)

#### 2. Teachers/Educators (Content Creators)
**Goals**: Create and deliver educational content, manage students

**Requirements**:
- Create and manage multiple classrooms
- Upload and organize learning materials (videos, documents, presentations)
- Create assignments, quizzes, and assessments
- Grade student work and provide feedback
- Monitor student progress and engagement
- Communicate with students (announcements, messaging)
- Generate progress reports and analytics

#### 3. Administrators (Platform Managers)
**Goals**: Oversee platform operations and maintain quality

**Requirements**:
- Manage user accounts and permissions
- Monitor platform usage and performance
- Moderate content and resolve disputes
- Configure platform settings and policies
- Access comprehensive analytics and reports
- Manage system integrations and updates

### Functional Requirements

#### Core Learning Management
1. **Content Creation & Management**
   - Rich text editor for lessons
   - File upload (documents, videos, images)
   - Lesson sequencing and prerequisites
   - Version control for content updates

2. **Assessment & Evaluation**
   - Multiple choice, essay, and practical assessments
   - Automated grading for objective questions
   - Rubric-based grading for subjective work
   - Plagiarism detection

3. **Progress Tracking & Analytics**
   - Individual student progress dashboards
   - Class-wide performance analytics
   - Learning path recommendations
   - Time-on-task tracking

4. **Communication & Collaboration**
   - In-platform messaging system
   - Discussion forums per classroom
   - Announcement system
   - Video conferencing integration

#### User Experience Requirements
1. **Accessibility**
   - WCAG 2.1 AA compliance
   - Screen reader compatibility
   - Keyboard navigation support
   - Multi-language support

2. **Performance**
   - Page load times under 3 seconds
   - Mobile-responsive design
   - Offline content access
   - Progressive Web App (PWA) features

3. **Security**
   - Data encryption in transit and at rest
   - Regular security audits
   - GDPR compliance
   - Secure file sharing

### Non-Functional Requirements

#### Scalability
- Support for 10,000+ concurrent users
- Horizontal scaling capabilities
- CDN integration for global content delivery
- Database optimization for large datasets

#### Reliability
- 99.9% uptime availability
- Automated backups and disaster recovery
- Error monitoring and alerting
- Graceful degradation during high load

#### Maintainability
- Comprehensive test coverage (>90%)
- Clear documentation and code comments
- Modular architecture for easy updates
- Continuous integration/deployment pipeline

## Use Cases

### Use Case 1: Student Course Discovery and Enrollment
**Actor**: Student  
**Goal**: Find and enroll in relevant courses

**Preconditions**: User has a student account

**Main Flow**:
1. Student logs into the platform
2. Student browses available public courses by subject/category
3. Student views course details (syllabus, teacher, requirements)
4. Student enrolls in desired course
5. For public courses: Immediate access granted
6. For private courses: Enrollment request sent to teacher
7. Student receives confirmation and can access course materials

**Extensions**:
- Course is full: Student joins waitlist
- Prerequisites not met: System suggests prerequisite courses
- Payment required: Student redirected to payment gateway (future feature)

### Use Case 2: Teacher Content Creation and Course Management
**Actor**: Teacher  
**Goal**: Create comprehensive course content and manage student learning

**Preconditions**: User has teacher account and verified credentials

**Main Flow**:
1. Teacher creates new classroom/course
2. Teacher uploads course syllabus and learning objectives
3. Teacher creates lesson modules with multimedia content
4. Teacher sets up assignments and assessments
5. Teacher configures grading rubrics and deadlines
6. Teacher publishes course for student enrollment
7. Teacher monitors student progress and provides feedback

**Extensions**:
- Content revision needed: Teacher updates materials
- Student needs help: Teacher provides additional resources
- Assessment adjustment: Teacher modifies grading criteria

### Use Case 3: Interactive Learning Session
**Actor**: Student and Teacher  
**Goal**: Engage in real-time learning activities

**Preconditions**: Both users are enrolled/teaching the same course

**Main Flow**:
1. Teacher schedules live session
2. Students receive notification
3. Participants join virtual classroom
4. Teacher shares screen/presents content
5. Students participate via chat/voice
6. Teacher conducts polls/quizzes during session
7. Session is recorded for later review
8. Follow-up materials are shared

### Use Case 4: Assessment and Grading Workflow
**Actor**: Student and Teacher  
**Goal**: Complete and evaluate learning assessments

**Preconditions**: Assessment is created and published

**Main Flow**:
1. Student accesses available assessment
2. Student completes questions within time limit
3. System auto-saves progress periodically
4. Student submits completed assessment
5. Objective questions are auto-graded
6. Subjective questions queue for teacher review
7. Teacher reviews and grades manually
8. Feedback and grades are published
9. Student receives notification of results

### Use Case 5: Progress Tracking and Analytics
**Actor**: Student, Teacher, Admin  
**Goal**: Monitor learning progress and identify improvement areas

**Main Flow**:
1. User accesses analytics dashboard
2. System displays relevant metrics:
   - Student: Personal progress, strengths/weaknesses
   - Teacher: Class performance, engagement rates
   - Admin: Platform-wide usage and trends
3. User filters data by time period/criteria
4. System generates insights and recommendations
5. User exports reports for external use
6. System sends automated progress alerts

### Use Case 6: Collaborative Learning Community
**Actor**: Multiple Students  
**Goal**: Engage in peer learning and knowledge sharing

**Main Flow**:
1. Students access course discussion forum
2. Student posts question or starts discussion
3. Peers respond with answers/insights
4. Teacher moderates and adds expert input
5. Community votes on best responses
6. Knowledge base builds over time
7. Students form study groups
8. Collaborative projects are assigned and completed

## Next Development Priorities

### Phase 1: Content Management System (Immediate - Next 2-3 months)
**Priority**: Critical - Foundation for all learning activities

**Features to Implement**:
1. **Lesson Module System**
   - Create lesson structure within classrooms
   - Rich text editor for lesson content
   - File upload capabilities (PDFs, videos, images)
   - Lesson ordering and prerequisites

2. **Basic Assignment System**
   - Create text-based assignments
   - File submission capabilities
   - Due date management
   - Basic grading interface

3. **Content Organization**
   - Folder structure for materials
   - Tags and categories for content
   - Search functionality within courses

**Database Changes Needed**:
```ruby
# New models to create:
- Lesson (belongs_to :class_room, has_many :lesson_contents)
- LessonContent (belongs_to :lesson, polymorphic content)
- Assignment (belongs_to :class_room, has_many :submissions)
- Submission (belongs_to :assignment, belongs_to :user)
```

### Phase 2: Assessment and Grading (3-4 months)
**Priority**: High - Essential for educational effectiveness

**Features to Implement**:
1. **Quiz/Test Creation**
   - Multiple choice questions
   - True/false questions
   - Short answer questions
   - Auto-grading for objective questions

2. **Grading System**
   - Grade book for teachers
   - Grade calculations and weightings
   - Student grade viewing
   - Grade export functionality

3. **Feedback System**
   - Comment system for assignments
   - Rubric-based grading
   - Peer review capabilities

### Phase 3: Communication and Collaboration (4-5 months)
**Priority**: High - Enhances learning experience

**Features to Implement**:
1. **Messaging System**
   - Teacher-student messaging
   - Class announcements
   - Discussion forums per classroom

2. **Real-time Features**
   - Live chat during lessons
   - Real-time collaboration tools
   - Notification system

3. **Community Features**
   - Study groups
   - Peer connections
   - Knowledge sharing forums

### Phase 4: Analytics and Progress Tracking (5-6 months)
**Priority**: Medium - Valuable for engagement and improvement

**Features to Implement**:
1. **Student Progress Dashboard**
   - Completion tracking
   - Time spent on materials
   - Performance analytics

2. **Teacher Analytics**
   - Class performance metrics
   - Engagement statistics
   - Content effectiveness analysis

3. **Reporting System**
   - Progress reports
   - Certificate generation
   - Export capabilities

### Phase 5: Advanced Features (6+ months)
**Priority**: Low-Medium - Nice-to-have enhancements

**Features to Consider**:
1. **Mobile App Development**
2. **Video Conferencing Integration**
3. **AI-powered Recommendations**
4. **Advanced Security Features**
5. **Multi-language Support**
6. **API for Third-party Integrations**

## Technical Debt and Improvements Needed

### Code Quality
- **Add comprehensive test coverage** - Currently minimal test files exist
- **Improve error handling** - Add proper exception handling throughout
- **Add API documentation** - No API docs currently exist
- **Security audit** - Review authentication and authorization logic

### Performance Optimizations
- **Database query optimization** - Add proper indexing and query optimization
- **Image/file upload handling** - Implement proper file management system
- **Caching strategy** - Leverage Solid Cache more effectively
- **Background job implementation** - Use Solid Queue for heavy operations

### User Experience
- **Improve UI/UX design** - Current interface is functional but basic
- **Add loading states** - Better user feedback during operations
- **Error message improvements** - More user-friendly error messages
- **Mobile experience** - Optimize for mobile usage patterns

## Success Metrics

### User Engagement
- Monthly Active Users (MAU)
- Course completion rates
- Time spent on platform
- User retention rates

### Educational Effectiveness
- Student performance improvements
- Teacher satisfaction scores
- Course quality ratings
- Learning outcome achievements

### Platform Growth
- New user registrations
- Course creation rates
- Platform usage growth
- Geographic reach expansion

## Conclusion

Scuti has a solid foundation with user management and basic classroom functionality. The immediate focus should be on implementing content management capabilities to make the platform truly functional for educational purposes. The roadmap prioritizes core learning features first, followed by engagement and analytics features that will make the platform competitive with existing solutions while maintaining its free and open-source nature.

The project shows great potential to achieve its mission of democratizing education, but requires significant development effort to reach feature parity with existing learning management systems.
