FROM plone/plone-backend:5.2.10
COPY docker/create-constraints.py docker/constraints.cfg docker/requirements.txt /app/
COPY versions.cfg /
RUN pip install -r https://dist.plone.org/release/5.2.10/requirements.txt ${PIP_PARAMS} && \
    python create-constraints.py constraints.cfg constraints.txt && \
    ./bin/pip install --ignore-requires-python -r requirements.txt -c constraints.txt ${PIP_PARAMS} && \
    ./bin/pip install --no-deps git+https://github.com/RedTurtle/design.plone.policy.git@fix_upgradestep#design.plone.policy && \
    find /app/lib -name LC_MESSAGES -exec chown -R plone:plone {} \;
