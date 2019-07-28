<?php

namespace App\Http\Controllers;

use App\Morphology;
use App\MorphologyType;
use App\Project;
use App\Subject;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;

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

        if(!isset($jsonMetadataObj) || empty($jsonMetadataObj)){
            $jsonMetadata = '{
                      "transform_front": {
                        "global": "translate(0px,0px) scale(1.0) rotate(0deg)",
                        "x": 0,
                        "y": 0,
                        "zoom": 1,
                        "degree": 0
                      },
                      "transform_profile": {
                        "global": "translate(0px,0px) scale(1.0) rotate(0deg)",
                        "x": 0,
                        "y": 0,
                        "zoom": 1,
                        "degree": 0
                      }
                    }';
        }

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


}
