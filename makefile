all:		install

.PHONY:		wheel
wheel:
		python setup.py bdist_wheel

.PHONY:		install
install:	wheel
		( cd dist ; pip install *.whl )

clean:
		rm -fr dist build zensols.medcat.egg-info .eggs
