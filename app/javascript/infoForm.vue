<template>
  <div id="infoForm">
    <button>Click here to display info form!</button>

    <div>
      <p>Info Form goes in this DIV</p>
      <p>The form must have a name input field</p>
      <p>The form must have a dropdown of events</p>
      <p>You must be able to submit the form</p>
    </div>
  </div>
</template>

<script>
export default {
  computed: {
    paramsBody() {
      return JSON.stringify({ info_form: {
        // info form fields need to be added here
      } })
    }
  },

  methods: {
    getEvents() {
      // Use path '/events.json'
      // Create a fetch call that gets all events.
      // Use events to diplay in form
    },

    submitForm() {
      // post a new form, creating a new info form in the database
      // Use path '/info_forms' to send the data
    }
  }
}
</script>

<style scoped>
</style>
