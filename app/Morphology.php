<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Morphology extends Model
{
    protected $table = 'morphology';

    public function morphologyType()
    {
        return $this->hasOne('App\MorphologyType','id', 'id_morphology_type');
    }
}
