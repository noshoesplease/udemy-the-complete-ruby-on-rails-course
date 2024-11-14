import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["column"]

  connect() {
    this.columns = this.columnTargets;

    // Set up drag events for each kanban item
    document.querySelectorAll(".kanban-item").forEach(item => {
      item.setAttribute("draggable", "true");
      item.addEventListener("dragstart", this.dragstartHandler.bind(this));
      item.addEventListener("dragend", this.dragendHandler.bind(this));
    });

    // Set up drop zone events for each column
    this.columns.forEach(column => {
      column.addEventListener("dragover", this.dragoverHandler.bind(this));
      column.addEventListener("drop", this.dropHandler.bind(this));
    });
  }

  dragstartHandler(event) {
    // Add the target element's id to the data transfer object
    event.dataTransfer.setData("text/plain", event.target.dataset.id);
    event.dataTransfer.effectAllowed = "move";
  }

  dragendHandler(event) {
    // Clean up any visual effects or attributes when dragging ends
    console.log("Drag ended for", event.target);
  }

  dragoverHandler(event) {
    // Allow the drop by preventing default
    event.preventDefault();
    event.dataTransfer.dropEffect = "move";
  }

  dropHandler(event) {
    event.preventDefault();
    // Retrieve the id of the dragged element
    const projectId = event.dataTransfer.getData("text/plain");

    // Append the dragged element to the new column
    const draggedElement = document.querySelector(`[data-id='${projectId}']`);
    event.currentTarget.appendChild(draggedElement);

    // Update the project's status on the server
    const newStatus = event.currentTarget.dataset.status;
    this.updateProjectStatus(projectId, newStatus);
  }

  updateProjectStatus(projectId, newStatus) {
    // Make a request to the server to update the project's status
    fetch(`/teams/${this.element.dataset.teamId}/kanban/update_status`, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector("[name='csrf-token']").content
      },
      body: JSON.stringify({ id: projectId, status: newStatus })
    }).then(response => {
      if (!response.ok) {
        console.error("Failed to update project status");
      }
    }).catch(error => {
      console.error("Error:", error);
    });
  }
}
