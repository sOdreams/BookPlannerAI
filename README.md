🧠 AI Planning Practice with PDDL

This project involves solving a planning problem using FF Planner and PDDL (Planning Domain Definition Language). The solution requires two main files: one for the Domain and one for the Problem.
🗂️ Project Structure
1. Domain File (domain.pddl)

The domain file defines the general rules and structure of the planning environment. It includes:

    Predicates:
    These describe relationships or properties of objects.
    Example: IsPredecessor, HasBeenRead.

    Actions (Operators):
    These describe possible changes in the environment. Each action has:

        Preconditions: Conditions that must be true for the action to be executed.

        Effects: The changes that occur when the action is executed.

2. Problem File (problem.pddl)

The problem file defines a specific planning instance using the domain. It includes:

    Objects:
    The specific items involved in the planning problem (e.g., a set of books).

    Initial State:
    The starting configuration of the environment.
    Example: No books have been read or placed yet.

    Goal State:
    The desired final situation after applying the planning actions.
    Example: All books are read or sorted in a specific order.

🛠️ Usage

    Define your domain.pddl and problem.pddl files.

    Use a planner like FF Planner to compute the plan.

    Analyze the plan steps and verify that they achieve the defined goal
