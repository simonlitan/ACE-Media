query 52178881 "Training Courses"
{
    Caption = 'Training Courses';
    QueryType = Normal;

    elements
    {
        dataitem(HRMTrainingCourses; "HRM-Training Courses")
        {
            column(CourseCode; "Course Code")
            {
            }
            column(CourseTittle; "Course Tittle")
            {
            }
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}
