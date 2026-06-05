# Game Development

This repository contains a series of incremental game development activities built in the Godot Engine, progressing from basic scenes to a multi-level game prototype with AI, UI, and 3D optimization.

## Week 1: Simple Scene with a Moving Node
* **Objective:** Establish engine familiarity and version control.
* **Details:** A basic Godot scene containing a `Label` node that displays "hello world". A GDScript is attached using the `_process(delta)` function to continuously update its X-axis position.
* **Screenshot:**
    ![Week 1](week1_moving_node.png)

## Week 2: Gameplay Mechanics & Level Design
* **Mechanics:** Implemented a player controller utilizing physics bodies and collision detection. The character can move and jump using mapped inputs. 
* **Level Design:** Designed a two-level endless runner prototype. 
    * **Level 1:** Introductory difficulty.
    * **Level 2:** Noticeably harder, triggered via a scene transition with an on-screen notification.
    * **Hazards:** Implemented traps using Area nodes. The game features no HP; colliding with a trap triggers an immediate scene reload.
* **Screenshot:**
    ![Week 2](week2_level_design.png)

## Week 3: UI/UX, Audio, and AI
* **UI/UX & Audio:** Integrated a `CanvasLayer` HUD for persistent on-screen elements. Configured audio buses to mix background music and sound effects (walk, run, slash, death).
* **AI Enemies:** Implemented basic enemy behavior using finite state machines. Enemies patrol designated areas and pose a threat separate from static environmental hazards.
* **Screenshot:**
    ![Week 3](week3_ai_ui.png)

## Week 4: 3D Basics & Optimization
* **Objective:** 3D implementation and performance profiling.
* **Details:** Utilization of 3D nodes (meshes, cameras) and `DirectionalLight`. The project was profiled using Godot's built-in debugger tools to ensure a stable 60 FPS output.
* **Screenshot:**
    ![Week 4](week4_3d_optimization.png)