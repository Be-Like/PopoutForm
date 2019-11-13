<template>
  <div id="infoForm">
    <button>Click here to display info form!</button>

    <div>
      Info Form Goes Here!
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      events: [],
      name: null
    }
  },

  methods: {
    getEvents() {
      // update the data `events` value to be an array of events on the site.
      // Use path '/events.json'
      // Create a fetch call that gets all events.
    },

    submitForm() {

    }
  }
}
</script>

<style scoped>
</style>
