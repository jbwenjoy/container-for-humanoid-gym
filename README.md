# container-for-humanoid-gym
Docker container for USC-DRCL's isaac (https://github.com/DRCL-USC/isaac/tree/sim2real)

Tested device (host): Ubuntu 22.04, NVIDIA RTX 4060, nvidia-driver-550, CUDA 12.2


## Instructions

1. Download IsaacGym Preview 4 and unzip, replace the files (`Dockerfile`, `build.sh`, `run.sh`) in `/.../isaacgym/docker/`.

2. Run `bash build.sh` and `bash run.sh` to build and enter the container.
   Remove `--rm` param in `run.sh` if you want to keep the container.
   Use `--display` if you wish to run the container with a display.
   After entering the container, by default you are using the python in `/usr/bin/python` or python3 in `/usr/bin/python3`.

   One thing to notice is that if you use the default user `gymuser`, you may have two python environments. It's important to know which python and pip you are using.
   If you do not wish to have such problems, you may always use root (running `sudo su` after entering the container).

4. Test if you can run IsaacGym examples

   ```sh
   cd /opt/isaacgym/python/examples
   python3 1080_balls_of_solitude.py
   ```

5. Install setup.py

   ```sh
   /usr/bin/python -m pip install --upgrade pip
   cd /workspace/humanoid-gym
   pip install -e .  # be careful which python you are using
   ```

   Some existing packages may conflict, you may keep an eye on the output
   and use `pip check` to check. For my case, I did the following:

   ```sh
   sudo pip uninstall thinc confection spacy dask dask-cuda dask-cudf distributed treelite treelite-runtime
   sudo pip install tornado==6.2
   ```

   Since these packages haven't been used in humanoid-gym yet, you may skip this. But do keep an eye on scipy. For me:

   ```sh
   sudo pip install scipy==1.10.1
   ```

   (May need) Then install what MPC solver requires:

   ```sh
   sudo pip install cvxopt
   ```

6. Test running isaac (README not completed yet)

   ```sh
   cd /workspace/isaac/
   python humanoid/scripts/sim2sim.py --load_model logs/XBot_ppo/exported/policies/policy_example.pt
   ```

   You should see the robot moving.
   ![image](https://github.com/user-attachments/assets/d6f4a70b-c60a-4d15-aa35-6c1b74df64b8)
