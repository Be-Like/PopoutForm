<template>
  <div id="infoForm">
    <RippleButton text="Fill the Form" @click="openForm = !openForm" />

    <transition name="slide">
      <div v-if="openForm" class="form-layout">
        <form @submit.prevent="submitForm()">
          <div class="close" @click="openForm = !openForm"></div>
          <h4>Event Registration</h4>

          <div v-if="errors">
            <p class="error-message" v-for="(error, key) in errors" :key="key">- {{error}}</p>
          </div>

          <span class="form-entry-field">
            <input
              class="input-format"
              type="text"
              name="name"
              placeholder="name"
              v-model="formData.name"
            />
          </span>

          <div class="form-entry-field">
            <select class="input-format" v-model="formData.event_id">
              <option v-if="formData.event_id == null" :value="null" selected>Please select an event</option>
              <option
                v-for="event in events"
                v-bind:key="event.id"
                v-bind:value="event.id"
              >{{event.name}}</option>
            </select>
          </div>
          <RippleButton text="Submit" class="right" />
        </form>
      </div>
    </transition>
  </div>
</template>

<script>
import RippleButton from "./rippleButton";

export default {
  components: {
    RippleButton
  },
  data: function() {
    return {
      openForm: false,
      events: [],
      formData: {
        name: "",
        event_id: null
      },
      ripples: [],
      errors: []
    };
  },
  methods: {
    async getEvents() {
      // Use path '/events.json'
      // Create a fetch call that gets all events.
      // Use events to diplay in form
      const res = await fetch("/events.json");
      const eventsJson = await res.json();
      this.events = eventsJson.events;
    },

    async submitForm() {
      // post a new form, creating a new info form in the database
      // Use path '/info_forms' to send the data
      const newTask = Object.assign({}, this.formData);

      const res = await fetch(`/info_forms.json`, {
        method: "POST",
        body: JSON.stringify(newTask),
        headers: {
          "Content-Type": "application/json"
        }
      });

      const json = await res.json();
      if (json.errors == 0) {
        console.log("Success:", JSON.stringify(json), newTask);
        this.errors = [];
        this.formData.name = "";
        this.formData.event_id = null;
        this.openForm = !this.openForm;
      } else {
        console.log("Fail:", JSON.stringify(json));
        this.errors = json.errors;
      }
    }
  },
  beforeMount: function() {
    this.getEvents();
  }
};
</script>

<style scoped></style>
