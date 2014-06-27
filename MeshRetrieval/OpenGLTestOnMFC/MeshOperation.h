#pragma once
#include "afxwin.h"
#include "OpenGLControl.h"
#include "Toolbox.h"

#include <gl/gl.h>
#include <gl/glu.h>
#include <vector>
#include <fstream>
#include <iostream>
#include <string>

//#include <stdlib.h>
using namespace std;

#undef min
#undef max
#include <OpenMesh/Core/IO/MeshIO.hh>
#include <OpenMesh/Core/Mesh/PolyMesh_ArrayKernelT.hh>
#include <OpenMesh/Core/System/config.h>
#include <OpenMesh/Core/Mesh/Status.hh>
#include <OpenMesh/Core/IO/exporter/ExporterT.hh>

#define DATASIZE 30
#define RADIUS 32
extern double candidate_index_array[DATASIZE];

struct MyTraits : public OpenMesh::DefaultTraits
{
	VertexAttributes(OpenMesh::Attributes::Status);
	FaceAttributes(OpenMesh::Attributes::Status);
	EdgeAttributes(OpenMesh::Attributes::Status);
};

using namespace std;

typedef OpenMesh::PolyMesh_ArrayKernelT<>  MyMesh;

void NormalizeMesh(MyMesh &mesh);
void AddNoise(double noise_standard_deviation,MyMesh &mesh);
void ChooseCandidate(double candidate_index_array[],int candidateIndx);
void NormalizeMesh(MyMesh &mesh,
				   vector<double> &grid_id_x,vector<double> &grid_id_y,vector<double> &grid_id_z);