<template>
  <div id="infoForm">
    <button class="ui primary button basic" @click="getEvents()">
      Click here to display info form!
    </button>

    <div>
      <p>Info Form goes in this DIV</p>
      <form>
        <p>The form must have a name input field</p>
        <div class="field">
          <input type="text" name="name" placeholder="name" required="true" />
        </div>
        <p>The form must have a dropdown of events</p>
        <div class="field">
          <select> </select>
        </div>
        <p>You must be able to submit the form</p>
      </form>
    </div>
  </div>
</template>

<script>
export default {
  data: function() {
    return {
      events: [],
      event: {}
    };
  },
  computed: {
    paramsBody() {
      return JSON.stringify({
        info_form: {
          // info form fields need to be added here
        }
      });
    }
  },
  methods: {
    async getEvents() {
      // Use path '/events.json'
      // Create a fetch call that gets all events.
      // Use events to diplay in form
      const res = await fetch('/events.json');
      const eventsJson = await res.json();
      console.log(JSON.stringify(eventsJson));
    },

    submitForm() {
      // post a new form, creating a new info form in the database
      // Use path '/info_forms' to send the data
    }
  },
  beforeMount: function() {
    this.getEvents();
  }
};
</script>

<style scoped></style>
