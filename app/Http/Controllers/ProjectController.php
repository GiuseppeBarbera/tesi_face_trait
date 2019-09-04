<?php

namespace App\Http\Controllers;

use App\Morphology;
use App\MorphologyType;
use App\Project;
use App\Subject;
use Barryvdh\DomPDF\Facade as PDF;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use function PHPSTORM_META\type;
use PHPUnit\Util\Json;

class ProjectController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $userId = Auth::user()->id;

        $projects = Project::where('id_user', '=', $userId)->get();
        return view('projects_list')->with('projects', $projects);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('projects_create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $subject = new Subject();
        $subject->name = $request->name;
        $subject->surname = $request->surname;
        $subject->age = $request->age;
        $subject->save();

        $project = new Project();
        $project->id_user = Auth::user()->id;
        $project->id_subject = $subject->id;
        $project->name = $request->project_name;
        $project->description = $request->project_description;

        $jsonMetadata = '{
                      "transform_front": {
                        "global": "translate(0px,0px) scale(1.0) rotate(0deg)",
                        "x": 0,
                        "y": 0,
                        "zoom": 1,
                        "degree": 0,
                        "shapes": {}
                      },
                      "transform_profile": {
                        "global": "translate(0px,0px) scale(1.0) rotate(0deg)",
                        "x": 0,
                        "y": 0,
                        "zoom": 1,
                        "degree": 0,
                        "shapes": {}
                      }
                    }';

        $project->metadata = utf8_encode($jsonMetadata);

        $project->save();

        return redirect('projects');

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return "show";
    }

    public function editor($id)
    {
        $morphologiesType = MorphologyType::all();
        $project = Project::find($id);
        return view('project_editor')->with('project', $project)->with('morphologiesType', $morphologiesType);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function delete(Request $request, $id)
    {
        $userId = Auth::user()->id;
        $projectId = $id;

        $project = Project::where('id_user', '=', $userId)->where('id', '=', $projectId);
        $project->delete();

        return redirect('projects');

    }

    public function getMorphologies(Request $request, $id){
        $morphologies = Morphology::where('id_morphology_type', $id)->get();
        return $morphologies->toJson();
    }

    public function uploadImage(Request $request, $project, $type){

        $validation = Validator::make($request->all(), [
            $type.'_image' => 'required|image|mimes:jpeg,png,jpg,gif|max:4096'
        ]);
        if($validation->passes())
        {
            $image = $request->file($type.'_image');
            $new_name = rand() . '.' . $image->getClientOriginalExtension();
            //$image->move(public_path('images'), $new_name);
            $path = Storage::disk('public')->put('photos', $request->file($type.'_image'));

            $idProject = $request->id;
            $project = Project::find($idProject);
            $subject = $project->subject()->get()[0];

            $url = Storage::disk('photos')->getDriver()->getConfig()->get('url') . explode('/', $path)[1];

            if($type == 'front') {
                $subject->path_image_front = $url;
            }else if($type == 'profile'){
                $subject->path_image_profile = $url;
            }
            $subject->save();

            //delete old metadata image
            $jsonMetadata = $project->metadata;
            $jsonMetadataObj = json_decode($jsonMetadata);

            if(isset($jsonMetadataObj)){
                if($type == 'front') {
                    $jsonMetadataObj->transform_front = null;
                }else if ($type == 'profile'){
                    $jsonMetadataObj->transform_profile = null;
                }
            }

            $project->metadata = json_encode($jsonMetadataObj);
            $project->save();

            return response()->json([
                'message'   => 'ok'
            ]);
        }
        else
        {
            return response()->json([
                'message'   => $validation->errors()->all(),
                'error'   => $validation->errors()->all()
            ]);
        }
    }

    public function saveMetadata(Request $request, $project, $type){

        $idProject = $request->id;
        $project = Project::find($idProject);
        $subject = $project->subject()->get()[0];

        $jsonMetadata = $project->metadata;
        $jsonMetadataObj = json_decode($jsonMetadata);

        if($type == 'front' || $type == 'all') {
            $jsonMetadataObjTransform = $jsonMetadataObj->transform_front;

            if(!isset($jsonMetadataObj->transform_profile)){
                $jsonMetadataObjTransform = new \stdClass();
            }

            $jsonMetadataObjTransform->global = $request->global_front;
            $jsonMetadataObjTransform->shapes = $request->shapes_front;
            $jsonMetadataObjTransform->x = intval($request->x_front);
            $jsonMetadataObjTransform->y = intval($request->y_front);
            $jsonMetadataObjTransform->zoom = floatval($request->zoom_front);
            $jsonMetadataObjTransform->degree = intval($request->degree_front);

            //$jsonMetadataObjTransform->w = $request->w;
            //$jsonMetadataObjTransform->h = $request->h;
            //$jsonMetadataObjTransform->id_shape = $request->id_shape;

            $jsonMetadataObj->transform_front = $jsonMetadataObjTransform;

        }

        if($type == 'profile' || $type == 'all'){
            $jsonMetadataObjTransform = $jsonMetadataObj->transform_profile;

            if(!isset($jsonMetadataObj->transform_profile)){
                $jsonMetadataObjTransform = new \stdClass();
            }

            $jsonMetadataObjTransform->global = $request->global_profile;
            $jsonMetadataObjTransform->shapes = $request->shapes_profile;
            $jsonMetadataObjTransform->x = intval($request->x_profile);
            $jsonMetadataObjTransform->y = intval($request->y_profile);
            $jsonMetadataObjTransform->zoom = floatval($request->zoom_profile);
            $jsonMetadataObjTransform->degree = intval($request->degree_profile);

            //$jsonMetadataObjTransform->w = $request->w;
            //$jsonMetadataObjTransform->h = $request->h;
            //$jsonMetadataObjTransform->id_shape = $request->id_shape;
            $jsonMetadataObj->transform_profile = $jsonMetadataObjTransform;

        }

        $project->metadata = json_encode($jsonMetadataObj);
        $project->save();
    }

    public function getMetadata(Request $request, $project, $type){

        $idProject = $request->id;

        $project = Project::find($idProject);
        $subject = $project->subject()->get()[0];

        $jsonMetadata = $project->metadata;

        if(isset($jsonMetadata)) {
            $jsonMetadataObj = json_decode($jsonMetadata);

            if ($type == 'front' && $jsonMetadataObj->transform_front) {
                $jsonMetadataObj->transform_front->type = 'front';
                return response()->json($jsonMetadataObj->transform_front);
            } else if ($type == 'profile' && $jsonMetadataObj->transform_profile) {
                $jsonMetadataObj->transform_profile->type = 'profile';
                return response()->json($jsonMetadataObj->transform_profile);
            } else{
                return response()->json();
            }
        }else{
            return response()->json();
        }
    }

    public function magicCheck(Request $request, $id){

        $idProject = $id;
        $project = Project::find($idProject);
        $subject = $project->subject()->get()[0];
        $type = $request->type;

        if($type == 'front'){
            $pathImage = $subject->path_image_front;
        }else if($type == 'profile'){
            $pathImage = $subject->path_image_profile;
        }

        if(count($request->listShapes) <= 1){
            return "To run Magic Check you should add at least 2 shape by type";
        }

        $campareArray = [];
        foreach ($request->listShapes as $shape){
            $pathShape = url(Morphology::find($shape['id_shape'])->path);
            $top = $shape['top'];
            $left = $shape['left'];
            $hightShape = $shape['h'];
            $widthShape = $shape['w'];
            $cmd = "/usr/local/bin/processing-java --sketch=" . base_path() . "/script/shapeComparison/ --run $pathImage $pathShape $hightShape $widthShape $top $left";
            $response = shell_exec ( $cmd);
            //var_dump($response);
            $response = explode("\n", $response)[0];
            $compareArray[$shape['id_shape']] = floatval($response);
            //return $response;
        }

        $maxMachtShapeId = array_keys($compareArray, min($compareArray));

        return "Best match is: " . Morphology::find($shape['id_shape'])->description;

        //$cmd = "/usr/local/bin/processing-java --sketch=" . base_path() . "/script/shapeComparison/ --run /Users/Peppe/Desktop/Tes/Img/Front.jpg /Users/Peppe/Desktop/Tes/Morfologie\ Modificate/Attaccatura\ dei\ capelli/Soggetti\ privi\ di\ \ Trichion/attaccatura_curvilinea.png";
        //$response = shell_exec ( $cmd);
        ////var_dump($response);
        //$response = explode("\n", $response)[0];
        //return $response;
    }

    public function generateReport(Request $request, $id){

        $project = Project::find($id);
        $subject = $project->subject()->get()[0];

        //info subject
        $name = $subject->name;
        $surname = $subject->surname;
        $age = $subject->age;
        $pathImageFront = $subject->path_image_front;
        $pathImageProfile = $subject->path_image_profile;

        //info project
        $createdAt = $project->created_at->toDayDateTimeString();
        $prjName = $project->name;
        $prjDesc = $project->description;

        //analize metadata json
        $prjMetadata = json_decode($project->metadata);
        $prjMetadataFront = $prjMetadata->transform_front;

        //image x transl
        $imageXFront = isset($prjMetadataFront->x) ? $prjMetadataFront->x : '0' ;

        //image y transl
        $imageYFront = isset($prjMetadataFront->y) ? $prjMetadataFront->y : '0';

        //image zoom
        $imageZoomFront = isset($prjMetadataFront->zoom) ? $prjMetadataFront->zoom : '1';

        //image zoom
        $imageDegreeFront = isset($prjMetadataFront->degree) ? @$prjMetadataFront->degree : '0';

        $listShapeFront = [];
        if(isset($prjMetadataFront->shapes)) {
            foreach ($prjMetadataFront->shapes as $shape) {
                $morph_id = $shape->morph_id;
                $morphology = Morphology::find($morph_id);
                $morphologyDesc = $morphology->description;
                $morphologyPath = $morphology->path;
                $morphologyTypeName = $morphology->morphologyType()->get()[0]->name;

                $obj = new \stdClass();
                $obj->morphId = $morph_id;
                $obj->morphologyDesc = $morphologyDesc;
                $obj->morphologyTypeName = $morphologyTypeName;
                $obj->morphologyPath = $morphologyPath;

                $listShapeFront[] = $obj;
            }
        }



        $prjMetadataProfile = $prjMetadata->transform_profile;

        //image x transl
        $imageXProfile = isset($prjMetadataProfile->x) ? $prjMetadataProfile->x : '0';

        //image y transl
        $imageYProfile = isset($prjMetadataProfile->y) ? $prjMetadataProfile->y : '0';

        //image zoom
        $imageZoomProfile = isset($prjMetadataProfile->zoom) ? $prjMetadataProfile->zoom : '1';

        //image zoom
        $imageDegreeProfile = isset($prjMetadataProfile->degree) ? $prjMetadataProfile->degree : '0';

        $listShapeProfile = [];
        if(isset($prjMetadataProfile->shapes)) {
            foreach ($prjMetadataProfile->shapes as $shape) {
                $morph_id = $shape->morph_id;
                $morphology = Morphology::find($morph_id);
                $morphologyDesc = $morphology->description;
                $morphologyPath = $morphology->path;
                $morphologyTypeName = $morphology->morphologyType()->get()[0]->name;

                $obj = new \stdClass();
                $obj->morphId = $morph_id;
                $obj->morphologyDesc = $morphologyDesc;
                $obj->morphologyTypeName = $morphologyTypeName;
                $obj->morphologyPath = $morphologyPath;


                $listShapeProfile[] = $obj;
            }
        }


        $data = [
            //project info
            'title' => 'Report',
            'prjName' => $prjName,
            'prjDesc' => $prjDesc,
            'prjCreatedAt' => $createdAt,
            //subject info
            'sbjName' => $name,
            'sbjSurname' => $surname,
            'sbjAge' => $age,
            //front info
            'srcFrontImage' => $pathImageFront,
            'frontTransationX' => $imageXFront,
            'frontTransationY' => $imageYFront,
            'frontRotation' => $imageDegreeFront,
            'frontScale' => $imageZoomFront,
            'listShapeFront' => $listShapeFront,
            //profile info
            'srcProfileImage' => $pathImageProfile,
            'profileTransationX' => $imageXProfile,
            'profileTransationY' => $imageYProfile,
            'profileRotation' => $imageDegreeProfile,
            'profileScale' => $imageZoomProfile,
            'listShapeProfile' => $listShapeProfile

        ];

        $pdf = PDF::loadView('report', $data);
        return $pdf->download('medium.pdf');


    }


}
