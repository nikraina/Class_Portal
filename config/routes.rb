Portal::Application.routes.draw do

  root 'home#login'

  #home
  get 'home/logintry' => 'home#logintry'
  post 'home/logintry' => 'home#logintry'
  get 'home/login' => 'home#login'
  post 'home/login' => 'home#login'


  #admin
  get 'admins/home' => 'admins#home'
  post 'admins/home' => 'admins#home'
  get 'admins/showinstructors' => 'admins#showinstructors'
  post 'admins/showinstructors' => 'admins#showinstructors'
  get 'admins/showstudents' => 'admins#showstudents'
  post 'admins/showstudents' => 'admins#students'
  get 'admins/studentrequests' => 'admins#studentrequests'
  post 'admins/studentrequests' => 'admins#studentrequests'

  #courses
  get 'courses/new' => 'courses#new'
  post 'courses/new' => 'courses#new'
  get 'courses/create' => 'courses#create'
  post 'courses/create' => 'courses#create'
  get 'courses/index' => 'courses#index'
  post 'courses/index' => 'courses#index'
  get 'courses/:id/show' => 'courses#show'
  post 'courses/:id/show' => 'courses#show'
  get 'courses/:id/edit' => 'courses#edit'
  post 'courses/:id/edit' => 'courses#edit'
  get 'courses/:id/update' => 'courses#update'
  patch 'courses/:id/update' => 'courses#update'
  get 'courses/:id/destroy' => 'courses#destroy'
  post 'courses/:id/destroy' => 'courses#destroy'


  #users
  get 'users/new' => 'users#new'
  post 'users/new' => 'users#new'
  get 'users/create' => 'users#create'
  post 'users/create' => 'users#create'
  get 'users/index' => 'users#index'
  post 'users/index' => 'users#index'
  get 'users/:id/show' => 'users#show'
  post 'users/:id/show' => 'users#show'
  get 'users/:id/edit' => 'users#edit'
  post 'users/:id/edit' => 'users#edit'
  get 'users/:id/update' => 'users#update'
  patch 'users/:id/update' => 'users#update'
  get 'users/:id/destroy' => 'users#destroy'
  post 'users/:id/destroy' => 'users#destroy'


  #instructors
  get 'instructors/home' => 'instructors#home'
  post 'instructors/home' => 'instructors#home'
  get 'instructors/viewinscourses' => 'instructors#viewinscourses'
  post 'instructors/viewinscourses' => 'instructors#viewinscourses'
  get 'instructors/insstudents' => 'instructors#insstudents'
  post 'instructors/insstudents' => 'instructors#insstudents'
  get 'instructors/studentsrequest' => 'instructors#studentsrequest'
  post 'instructors/studentsrequest' => 'instructors#studentsrequest'

  #students
  get 'students/home' => 'students#home'
  post 'students/home' => 'students#home'
  get 'students/viewcourses' => 'students#viewcourses'
  post 'students/viewcourses' => 'students#viewcourses'


  #instructorCources
  get 'instructor_courses/new' => 'instructor_courses#new'
  post 'instructor_courses/new' => 'instructor_courses#new'
  get 'instructor_courses/create' => 'instructor_courses#create'
  post 'instructor_courses/create' => 'instructor_courses#create'
  get 'instructor_courses/index' => 'instructor_courses#index'
  post 'instructor_courses/index' => 'instructor_courses#index'
  get 'instructor_courses/:id/edit' => 'instructor_courses#edit'
  post 'instructor_courses/:id/edit' => 'instructor_courses#edit'
  get 'instructor_courses/:id/update' => 'instructor_courses#update'
  patch 'instructor_courses/:id/update' => 'instructor_courses#update'
  get 'instructor_courses/:id/destroy' => 'instructor_courses#destroy'
  post 'instructor_courses/:id/destroy' => 'instructor_courses#destroy'
  get 'instructor_courses/:id/insthistory' => 'instructor_courses#insthistory'
  post 'instructor_courses/:id/insthistory' => 'instructor_courses#insthistory'



  #StudentCources
  get 'student_courses/new' => 'student_courses#new'
  post 'student_courses/new' => 'student_courses#new'
  get 'student_courses/create' => 'student_courses#create'
  post 'student_courses/create' => 'student_courses#create'
  get 'student_courses/index' => 'student_courses#index'
  post 'student_courses/index' => 'student_courses#index'
  get 'student_courses/:id/edit' => 'student_courses#edit'
  post 'student_courses/:id/edit' => 'student_courses#edit'
  get 'student_courses/:id/update' => 'student_courses#update'
  patch 'student_courses/:id/update' => 'student_courses#update'
  get 'student_courses/:id/studentcourses' => 'student_courses#studentcourses'
  post 'student_courses/:id/studentcourses' => 'student_courses#studentcourses'
  get 'student_courses/:id/studenthistory' => 'student_courses#studenthistory'
  post 'student_courses/:id/studenthistory' => 'student_courses#studenthistory'

end
