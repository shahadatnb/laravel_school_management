<div class="id-card-back text-center align-middle">
    @php $data = "Name: {$student->name} ID:{$student->id}" @endphp
    {!! QrCode::size(80)->generate($student->id) !!} <br>
    <p style="font-weight: bold; color: red">If you found return to</p>
    <p style="font-size: 4mm; line-height: 4mm">
        {{ config('settings.siteTitle','') }}, {{ config('settings.siteAddress','') }}, Phone: {{ config('settings.sitePhone','') }}
        E-mail: {{ config('settings.siteEmail','') }}<br> Web: {{ config('settings.siteWeb','') }}
    </p>
    <p>Card valid till Dec-2024</p>
</div>