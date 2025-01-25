# container-for-humanoid-gym
Docker container for humanoid-gym (roboterax/umanoid-gym)


## Instructions

1. Download IsaacGym Preview 4 and unzip, replace the files (`Dockerfile`, `build.sh`, `run.sh`) in `/.../isaacgym/docker/`.

2. Test if you can run IsaacGym examples

   ```sh
   cd /opt/isaacgym/python/examples
   python3 1080_balls_of_solitude.py
   ```

3. Install setup.py

   Remember to upgrade pip.

   ```sh
   /usr/bin/python -m pip install --upgrade pip
   cd /workspace/humanoid-gym
   pip install -e .
   ```

4. Test running humanoid-gym

   ```sh
   cd /workspace/humanoid-gym/
   python humanoid/scripts/sim2sim.py --load_model logs/XBot_ppo/exported/policies/policy_example.pt
   ```

   You should see the robot moving.
   ![image](https://github.com/user-attachments/assets/d6f4a70b-c60a-4d15-aa35-6c1b74df64b8)
