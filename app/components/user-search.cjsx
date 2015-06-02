React = require 'react'
Select = require 'react-select'
PromiseRenderer = require './promise-renderer'
apiClient = require '../api/client'

module.exports = React.createClass
  displayName: 'UserSearch'

  searchUsers: (value, callback) ->
    unless value is ''
      apiClient.type('users').get display_name: value, page_size: 10
        .then (users) =>
          opts = for user in users
            { value: user.id, label: user.display_name }
          callback null, {
            options: opts
          }

  render: ->
    <Select
      multi={true}
      name="userids"
      className="user-search"
      asyncOptions={@searchUsers} />
