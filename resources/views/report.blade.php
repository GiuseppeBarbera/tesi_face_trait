<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>{{$title}}</title>
</head>
<body>

<div>
    <h1 style="text-align: center">Report</h1>
</div>

<div>
    <p>
        <h2>Project Information</h2>
        <div>
            Name: {{$prjName}}
        </div>
        <div>
            Description: {{$prjDesc}}
        </div>
        <div>
            Created at: {{$prjCreatedAt}}
        </div>

    </p>

    <p>
        <h2>Subject Information</h2>
        <div>
            Name: {{$sbjName}}
        </div>
        <div>
            Surname: {{$sbjSurname}}
        </div>
        <div>
            Age: {{$sbjAge}}
        </div>
    </p>

    <p>
        <h2>Front Image Information</h2>
        <div style="width: 400px">
            <img style="max-width: 400px;" src="{{$srcFrontImage}}">
        </div>
        <div>
            Scale: {{$frontScale}}x
        </div>
        <div>
            Translation X: {{$frontTransationX}} px
        </div>
        <div>
            Translation Y: {{$frontTransationY}} px
        </div>
        <div>
            Rotation: {{$frontRotation}} degree
        </div>
        <div>
            @if(count($listShapeFront))
                <h3>Shape info</h3>
                @foreach ($listShapeFront as $shapeFront)
                    <div>Morphology Type: {{$shapeFront->morphologyTypeName}}</div>
                    <div>Morphology Description: {{$shapeFront->morphologyDesc}}</div>
                    <div style="width: 50px; padding: 25px">
                        <img style="max-width: 50px;" src="{{$shapeFront->morphologyPath}}">
                    </div>
                @endforeach
            @endif
        </div>

    </p>

    <p>
    <h2>Profile Image Information</h2>
    <div style="width: 400px">
        <img style="max-width: 400px;" src="{{$srcProfileImage}}">
    </div>
    <div>
        Scale: {{$profileScale}}x
    </div>
    <div>
        Translation X: {{$profileTransationX}} px
    </div>
    <div>
        Translation Y: {{$profileTransationY}} px
    </div>
    <div>
        Rotation: {{$profileRotation}} degree
    </div>
    <div>
        @if(count($listShapeProfile))
            <h3>Shape info</h3>
            @foreach ($listShapeProfile as $shapeProfile)
                <div>Morphology Type: {{$shapeProfile->morphologyTypeName}}</div>
                <div>Morphology Description: {{$shapeProfile->morphologyDesc}}</div>
                <div style="width: 50px; padding: 25px">
                    <img style="max-width: 50px;" src="{{$shapeProfile->morphologyPath}}">
                </div>
            @endforeach
        @endif
    </div>

    </p>

    <div style="text-align: right">
        Report generated at: {{date("d-M-Y H:m:s T")}}
    </div>





</div>
</body>
</body>
</html>