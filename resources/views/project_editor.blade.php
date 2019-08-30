@extends('layouts.app')

@section('content')
    <input id="project_id" name="project_id" type="hidden" value="{{$project->id}}">
    <input id="csrf_token" name="csrf_token" type="hidden" value="{{ csrf_token() }}">
    <div class="container">
        <div class="bd-example bd-example-tabs">
            <nav>
                <div class="nav nav-tabs" id="nav-tab" role="tablist">
                    <a class="nav-item nav-link active show" id="nav-front-tab" data-toggle="tab" href="#nav-front" role="tab" aria-controls="nav-contact" aria-selected="true">Front</a>
                    <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">Profile</a>
                </div>
            </nav>

            <div class="tab-content" id="nav-tabContent">
                <div class="tab-pane fade active show" id="nav-front" role="tabpanel" aria-labelledby="nav-contact-tab">

                    <div class="row mt-auto">
                        <div class="droppable col-md-8 container-img">
                            <!--<canvas id="front_canvas" width="500" height="500" style="border:1px solid #000000;" ></canvas>-->
                            @if (isset($project->subject()->get()[0]->path_image_front))
                                <img id="front_img" class="img-fluid" src="{{ asset($project->subject()->get()[0]->path_image_front) }}">
                            @else
                                <div class="courtesy_text_image">
                                    <h4>Front image not uploaded yet!</h4>
                                </div>
                            @endif

                        </div>

                        @if (isset($project->subject()->get()[0]->path_image_front))
                            <div class="col-md-4">
                                <div class="form-group container-shape">
                                    @foreach ($morphologiesType as $morphologyType)
                                        @php
                                            $varcheck = 0;
                                        @endphp
                                        @foreach($morphologyType->morphology()->get() as $morphology)
                                            @if($morphology->type == 'cx')
                                                @php
                                                $varcheck++;
                                                @endphp
                                            @endif
                                        @endforeach

                                        @if($varcheck != 0 )
                                        <button id="magic_front_{{$morphologyType->id}}" data-morph-type-id="{{$morphologyType->id}}" class="btn btn-primary magic_front">Check <i class="fas fa-magic"></i></button>
                                        <label for="select_morphology_type_front">{{$morphologyType->name}}</label>
                                        <div class="column">
                                            @foreach($morphologyType->morphology()->get() as $morphology)
                                                @if($morphology->type == 'cx')
                                                    <img class="draggable_front_creator shape" title="{{$morphology->description}}" data-morph="{{$morphology->id}}" data-morph-type="{{$morphologyType->id}}" data-linked-to="{{$morphology->linked_to}}" id="morph_front_{{$morphology->id}}" src="{{asset($morphology->path)}}">
                                                @endif
                                            @endforeach
                                        </div>
                                        @endif
                                    @endforeach
                                </div>

                                <hr/>

                                <div class="draggable_front_container">

                                </div>

                            </div>
                        @endif
                    </div>

                    @if (isset($project->subject()->get()[0]->path_image_front))
                        <div class="row mt-3">
                            <div id="action_bar_rotate_front" class="col-md-3">
                                <button id="l_rotate_front" class="btn rotate_button"><i class="fas fa-undo"></i> L Rotate</button>
                                <button id="r_rotate_front" class="btn rotate_button"><i class="fas fa-redo"></i></i> R Rotate</button>
                            </div>
                            <div id="action_bar_zoom_front" class="col-md-3">
                                <button id="plus_zoom_front" class="btn zoom_button"><i class="fas fa-search-plus"></i> + Zoom</button>
                                <button id="minus_zoom_front" class="btn zoom_button"><i class="fas fa-search-minus"></i> - Zoom</button>
                            </div>
                            <div id="action_bar_translate_front" class="col-md-3">
                                <button id="move_left_front" class="btn move_button"><i class="fas fa-arrow-left"></i></button>
                                <button id="move_right_front" class="btn move_button"><i class="fas fa-arrow-right"></i></button>
                                <button id="move_up_front" class="btn move_button"><i class="fas fa-arrow-up"></i></button>
                                <button id="move_down_front" class="btn move_button"><i class="fas fa-arrow-down"></i></button>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div id="action_bar_front" class="col-md-3">
                                <button id="save_front_metadata" class="btn btn-primary"><i class="far fa-save"></i> Save</button>
                                <a class='report' href="../../projects/{{$project->id}}/report">Download Report</a>
                            </div>
                        </div>
                    @endif

                    <div class="row mt-3">
                        <div class="col-md-3">
                            <form method="post" id="upload_front_form" enctype="multipart/form-data">
                                {{ csrf_field() }}
                                <input name="project_id" type="hidden" value="{{$project->id}}">
                                <div class="form-group">
                                    <table class="table">
                                        <tr>
                                            <td width="40%" align="right"><label>Select File for Upload</label></td>
                                            <td width="30"><input type="file" name="front_image" id="front_image" /></td>
                                            <td width="30%" align="left"><input type="submit" name="upload" id="upload_front" class="btn btn-primary" value="Upload"></td>
                                        </tr>
                                        <tr>
                                            <td width="40%" align="right"></td>
                                            <td width="30"><span class="text-muted">jpg, png, gif</span></td>
                                            <td width="30%" align="left"></td>
                                        </tr>
                                    </table>
                                </div>
                            </form>
                        </div>
                    </div>


                </div>

                <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">


                    <div class="row mt-auto">
                        <div class="droppable col-md-8 container-img">
                            <!--<canvas id="front_canvas" width="500" height="500" style="border:1px solid #000000;" ></canvas>-->
                            @if (isset($project->subject()->get()[0]->path_image_profile))
                                <img id="profile_img" class="img-fluid" src="{{ asset($project->subject()->get()[0]->path_image_profile) }}">
                            @else
                                <div class="courtesy_text_image">
                                    <h4>Profile image not uploaded yet!</h4>
                                </div>
                            @endif

                        </div>

                        @if (isset($project->subject()->get()[0]->path_image_profile))
                            <div class="col-md-4">
                                <div class="form-group container-shape">
                                    @foreach ($morphologiesType as $morphologyType)
                                        @php
                                            $varcheck2 = 0;
                                        @endphp
                                        @foreach($morphologyType->morphology()->get() as $morphology)
                                            @if($morphology->type == 'sx' || $morphology->type == 'dx')
                                                @php
                                                    $varcheck2++;
                                                @endphp
                                            @endif
                                        @endforeach
                                        @if($varcheck2 != 0)
                                            <button id="magic_profile_{{$morphologyType->id}}" data-morph-type-id="{{$morphologyType->id}}" class="btn btn-primary magic_profile">Check <i class="fas fa-magic"></i></button>
                                            <label for="select_morphology_type_profile">{{$morphologyType->name}}</label>
                                        <div class="column">
                                            @foreach($morphologyType->morphology()->get() as $morphology)
                                                @if($morphology->type != 'cx')
                                                <img class="draggable_profile_creator shape" title="{{$morphology->description}}" data-morph="{{$morphology->id}}" data-morph-type="{{$morphologyType->id}}" data-linked-to="{{$morphology->linked_to}}" id="morph_profile_{{$morphology->id}}" src="{{asset($morphology->path)}}">
                                                @endif
                                            @endforeach
                                        </div>
                                        @endif
                                    @endforeach
                                </div>

                                <hr/>

                                <div class="draggable_profile_container">

                                </div>

                            </div>
                        @endif
                    </div>

                    @if (isset($project->subject()->get()[0]->path_image_profile))
                        <div class="row mt-3">
                            <div id="action_bar_rotate_profile" class="action_bar_rotate col-md-3">
                                <button id="l_rotate_profile" class="btn rotate_button"><i class="fas fa-undo"></i> L Rotate</button>
                                <button id="r_rotate_profile" class="btn rotate_button"><i class="fas fa-redo"></i></i> R Rotate</button>
                            </div>
                            <div id="action_bar_zoom_profile" class="col-md-3">
                                <button id="plus_zoom_profile" class="btn zoom_button"><i class="fas fa-search-plus"></i> + Zoom</button>
                                <button id="minus_zoom_profile" class="btn zoom_button"><i class="fas fa-search-minus"></i> - Zoom</button>
                            </div>
                            <div id="action_bar_translate_profile" class="col-md-3">
                                <button id="move_left_profile" class="btn move_button"><i class="fas fa-arrow-left"></i></button>
                                <button id="move_right_profile" class="btn move_button"><i class="fas fa-arrow-right"></i></button>
                                <button id="move_up_profile" class="btn move_button"><i class="fas fa-arrow-up"></i></button>
                                <button id="move_down_profile" class="btn move_button"><i class="fas fa-arrow-down"></i></button>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div id="action_bar_profile_save" class="col-md-3">
                                <button id="save_profile_metadata" class="btn btn-primary"><i class="far fa-save"></i> Save</button>
                                <a class='report' href="../../projects/{{$project->id}}/report">Download Report</a>
                            </div>
                        </div>
                    @endif

                    <div class="row mt-3">
                        <div class="col-md-3">
                            <form method="post" id="upload_profile_form" enctype="multipart/form-data">
                                {{ csrf_field() }}
                                <input name="project_id" type="hidden" value="{{$project->id}}">
                                <div class="form-group">
                                    <table class="table">
                                        <tr>
                                            <td width="40%" align="right"><label>Select File for Upload</label></td>
                                            <td width="30"><input type="file" name="profile_image" id="profile_image" /></td>
                                            <td width="30%" align="left"><input type="submit" name="upload" id="upload_profile" class="btn btn-primary" value="Upload"></td>
                                        </tr>
                                        <tr>
                                            <td width="40%" align="right"></td>
                                            <td width="30"><span class="text-muted">jpg, png, gif</span></td>
                                            <td width="30%" align="left"></td>
                                        </tr>
                                    </table>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>





@endsection

@section('script')
    <script type="text/javascript" src="{{ asset('js/editor.js') }}"></script>
    <script type="text/javascript" src="{{ asset('js/jquery-ui.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('js/jquery.ui.rotatable.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('js/htmlToCanvas.js') }}"></script>
@endsection

@section('css')
    <link href="{{ asset('css/editor.css') }}" rel="stylesheet">
    <link href="{{ asset('css/jquery-ui.min.css') }}" rel="stylesheet">
@endsection
