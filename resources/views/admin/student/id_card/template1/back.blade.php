<div class="id-card-back text-center align-middle">
    @php $semester = $student->semester? $student->semester->name : '';
    $address = "ID:{$student->reg_no} Class: {$semester}" @endphp
    {{-- {!! QrCode::size(80)->generate($student->reg_no) !!} <br> --}}
    <p style="font-weight: bold; color: red">If you found return to</p>
    <p style="font-size: 4mm; line-height: 4mm">
        {{ session('branch')['name'] }}, {{ session('branch')['address'] }}, Phone: {{ session('branch')['contact'] }}<br>
        E-mail: {{ session('branch')['email'] }}
        {{-- {{ session('branch')['website'] ? '<br>Web: '.session('branch')['website'] : '' }} --}}
    </p>
    <p>{{ $data['valid_date'] !='' ? 'Card valid till '.$data['valid_date'] : '' }}</p>
</div>