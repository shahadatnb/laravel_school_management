<?php

namespace App\Imports;


use App\Traits\StudentTrait;
use App\Models\Student\Student;
use App\Models\Student\StudentMark;
use Maatwebsite\Excel\Concerns\ToModel;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Maatwebsite\Excel\Concerns\WithValidation;
use Maatwebsite\Excel\Concerns\ToCollection;

class StudentsImport implements ToCollection, WithHeadingRow, WithValidation
{
    use StudentTrait;
    public function collection(Collection $rows)
    {

        //dd(session('import_student')['section_id']); exit;

        foreach ($rows as $row) 
        {            
            $student_array['branch_id'] = session('branch')['id'];
            $student_array['reg_no'] = $this->newReg();
            $student_array['class_roll'] = trim($row['class_roll']);
            $student_array['name'] = trim($row['name']);
            $student_array['fathersName'] = trim($row['fathersname']);
            $student_array['mothersName'] = trim($row['mothersname']);
            //$student_array['address'] = trim($row['address']);
            $student_array['sex'] = trim($row['sex']);
            $student_array['mobile'] = trim($row['mobile']);
            $student_array['semester_id'] = session('import_student')['semester_id'];
            $student_array['section_id'] = session('import_student')['section_id'];
            //dd($student_array);
            $student = Student::create($student_array);
        }
    }

    public function rules(): array
    {
        return [
            'name' => ['required', 'string', 'max:150'],
            //'reg_no' => ['required', 'max:25', 'unique:students,reg_no'],//, 'alpha_dash'
            'class_roll' => ['nullable', 'numeric'],
            'fathersname' => ['required', 'string'],
            'mothersname' => ['required', 'string'],
            //'semester_id' => ['required', 'numeric'],
            'mobile' => ['required'],
        ];
    }
}
