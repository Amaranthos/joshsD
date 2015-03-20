module Matrix;

import std.stdio, std.string;

struct Matrix {
	uint cols;
	uint rows;
	double[] elements;

	this(uint i, uint j) {
		cols = i;
		rows = j;
		elements = new double[](i * j);
	}

	ref double Element(size_t i, size_t j) {
		return elements[j + i * rows];
	}

	ref double opIndex(size_t i, size_t j) {
		return Element(i, j);
	}

	Matrix opBinary	(string op) (ref Matrix rhs) {
		static if(op == "*") {
			return Multiply(rhs);
		}
		else static if(op == "/") {
			throw new Exception("No matrix division, inverses can fuck off");
		}
		else {
			if(rows != rhs.rows && cols != rhs.cols) {
				throw new Exception("Matrices must have the same dimensions for " ~ op ~ " operation");
			}
			Matrix result = Matrix(cols, rows);
			mixin("result.elements[]= elements[] " ~ op ~ " rhs.elements[];");
			return result;
		}
	}

	Matrix Multiply(ref Matrix rhs) {
		if(rows != rhs.cols) {
			throw new Exception("Illegal dimensions for Matrix Multiplication");
		}
		auto result = Matrix(cols, rhs.rows);

		for(size_t i = 0; i < cols; i++) {
			for(size_t j = 0; j < rhs.rows; j++) {
				double sum = 0.0;
				for(size_t k = 0; k < rows; k++) {
					sum += Element(i,k) * rhs[k,j];
				}
				result.Element(i, j) = sum;
			}
		}

		return result;
	}

	string toString() {
		string output;

		for (int i = 0; i < cols; i++) {

		}
	}
}