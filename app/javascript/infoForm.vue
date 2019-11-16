<template>
  <div id="infoForm">
    <button class="btn-submit" ref="btnRipple" @click="openForm = !openForm">
      Fill the Form
      <span
        class="ripple"
        v-bind:ref="'ripple-' + i"
        v-for="(val, i) in ripples"
        v-bind:style="{'top': val.y + 'px', 'left': val.x + 'px'}"
        v-bind:key="i"
        v-on:animationend="rippleEnd(i)"
      ></span>
    </button>

    <!-- <div>
      <transition name="slide">
        <h3 v-if="openForm">This is the test slider</h3>
      </transition>
    </div>-->

    <transition name="slide">
      <div v-if="openForm" class="form-layout">
        <form @submit.prevent="submitForm()">
          <p>Info Form goes in this DIV</p>

          <p>The form must have a name input field</p>
          <span>
            <input
              class="input-format"
              type="text"
              name="name"
              placeholder="name"
              required="true"
              v-model="formData.name"
            />
          </span>
          <p>The form must have a dropdown of events</p>
          <div class="field">
            <select class="input-format" v-model="formData.event_id">
              <option
                v-for="event in events"
                v-bind:key="event.id"
                v-bind:value="event.id"
              >{{event.name}}</option>
            </select>
          </div>
          <p>You must be able to submit the form</p>
          <button class="btn-submit right" ref="btnRipple" v-on:click="animateRipple">
            Submit
            <span
              class="ripple"
              v-bind:ref="'ripple-' + i"
              v-for="(val, i) in ripples"
              v-bind:style="{'top': val.y + 'px', 'left': val.x + 'px'}"
              v-bind:key="i"
              v-on:animationend="rippleEnd(i)"
            ></span>
          </button>
        </form>
      </div>
    </transition>

    <!-- TODO: add error handling for client -->
    <ul>
      <li v-for="event in events" v-bind:key="event.id">{{event}}</li>
    </ul>
    <ul>
      <li v-for="event in events" v-bind:key="event.id">{{event}}</li>
    </ul>
    <ul>
      <li v-for="event in events" v-bind:key="event.id">{{event}}</li>
    </ul>
    <ul>
      <li v-for="event in events" v-bind:key="event.id">{{event}}</li>
    </ul>
  </div>
</template>

<script>
export default {
  data: function() {
    return {
      openForm: false,
      events: [],
      formData: {},
      ripples: []
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
      console.log("Success:", JSON.stringify(json), newTask);
    },

    animateRipple: function(e) {
      let el = this.$refs.btnRipple;
      let pos = el.getBoundingClientRect();

      this.ripples.push({
        x: e.clientX - pos.left,
        y: e.clientY - pos.top
      });
    },
    rippleEnd: function(i) {
      this.ripples.splice(i, 1);
    }
  },
  beforeMount: function() {
    this.getEvents();
  }
};
</script>

<style scoped></style>
