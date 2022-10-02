all:		package

.PHONY:		package
package:
		python setup.py bdist_wheel
		python setup.py bdist_egg

.PHONY:		install
install:	package
		( cd dist ; pip install *.whl )

.PHONY:		deploy
deploy:
		@for i in dist/* ; do \
			python -m twine upload --sign-with landes@mailc.net \
				--username zensols \
				--repository-url https://upload.pypi.org/legacy/ \
				$$i ; \
		done

clean:
		rm -fr dist build zensols.medcat.egg-info .eggs
