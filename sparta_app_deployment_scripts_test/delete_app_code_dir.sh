#!/bin/bash

echo deleting cloudfun1-sparta-app-code
if [ -d "cloudfun1-sparta-app-code" ]; then
    # remove the directory
    rm -rf cloudfun1-sparta-app-code
fi

ls -la